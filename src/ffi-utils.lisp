(in-package :msi.ffi-utils)


;;; TYPE: foreign complex type declaration
(cffi:defcstruct complex-float
  (realpart :float)
  (imagpart :float))

(cffi:defcstruct complex-double
  (realpart :double)
  (imagpart :double))


;;; MACRO: make-static-array
(defmacro make-static-array (dimensions &key element-type initial-element initial-contents)
  #+allegro
  `(make-array
    ,@`(,dimensions
	:element-type ,element-type
	,@(when initial-element `(:initial-element ,initial-element))
	,@(when initial-contents `(:initial-contents ,initial-contents))
	:allocation :static-reclaimable))
  #+sbcl
  (progn
    (eval-when (:compile-toplevel)
      (warn 'style-warning "SBCL does not support static array currently. Use them with macro with-arrays-as-foreign-arrays and turn of GC during foreign funcalls (e.g. sb-sys:without-gcing).")) 
    `(make-array
      ,@`(,dimensions
	  :element-type ,element-type
	  ,@(when initial-element `(:initial-element ,initial-element))
	  ,@(when initial-contents `(:initial-contents ,initial-contents)))))
  #+lispworks
  `(make-array
    ,@`(,dimensions
	:element-type ,element-type
	,@(when initial-element `(:initial-element ,initial-element))
	,@(when initial-contents `(:initial-contents ,initial-contents))
	:allocation :static))
  )


;;; MACRO: with-safe-foreign-function-call-settings
;;; TODO: try to remove without-interrupts
(defmacro with-safe-foreign-function-call-settings (&body body)
  #+(and allegro smp-macros)
  `(excl:with-delayed-interrupts ,@body)
  #+(and allegro (not smp-macros))
  `(excl:without-interrupts ,@body)
  #+sbcl
  ;; sb-sys:without-gcing also works, but interrupting intel mkl calls
  ;; might crash SBCL.
  `(sb-sys:without-interrupts ,@body)
  #+lispworks
  `(lispworks:without-interrupts ,@body)
  )


;;; MACRO: with-arrays-as-foreign-arrays
(defmacro with-arrays-as-foreign-arrays ((&rest array-bindings) &body body)
  (declare (ignorable array-bindings))
  #+(and allegro smp-macros)
  `(excl:with-pinned-objects ,array-bindings ,@body) 
  #+(and allegro (not smp-macros))
  `(locally ,@body) 
  #+sbcl
  (cond (array-bindings
	 `(sb-sys:with-pinned-objects ,(mapcar #'second array-bindings)
	    (let ,(mapcar (lambda (array-binding)
			    `(,(first array-binding)
			       (sb-sys:vector-sap (SB-KERNEL:%WITH-ARRAY-DATA ,(second array-binding) 0 0))))
		   array-bindings)
	      ,@body)))
	(t `(locally ,@body)))
  #+lispworks
  (labels ((build-exp (array-bindings &rest body)
	     (cond (array-bindings
		    `(fli:with-dynamic-lisp-array-pointer ,(first array-bindings)
		       ,(apply #'build-exp (rest array-bindings) body)))
		   (t`(locally ,@body)))))
    (apply #'build-exp array-bindings body))
  )



;;; MACRO: defffun for fortran calling convention

;; Every non-array arguments will be passed by reference

;; Array type specifier: (array <element-type> *...)
;; String type specifier: :char or :string
;; Complex type specifier: complex-float complex-double

;; NOTE: The function defined with defffun will return all the
;; non-array out-params and the return value in multiple values, the
;; first is the return value. If it's a fortran subroutine which means
;; the return type is :void, it may not return any value.

;;; helper functions
(defun string-type-p (var-type)
  ;; a string var has type (or :char :string)
  (assert (or (symbolp var-type) (listp var-type)))
  (member var-type '(:char :string)))

(defun complex-type-p (var-type)
  (assert (or (symbolp var-type) (listp var-type)))
  (member var-type '(complex-float complex-double)))

(defun array-type-p (var-type)
  ;; array type: (:array <type> <dimensions>...)
  (assert (or (symbolp var-type) (listp var-type)))
  (eq (first (ensure-list var-type)) :array))

(defun pointer-type-p (var-type)
  ;; Complex types are the special cases since it's defined as c structs.
  ;; String values will be returned so not a pointer type here.
  (assert (or (symbolp var-type) (listp var-type)))
  (and (not (string-type-p var-type))
       (not (member var-type '(complex-float complex-double)))
       ;; (:array ...) will be canonicalized to :pointer
       (eq (cffi::canonicalize-foreign-type var-type) :pointer)))


(defun separate-items (predicate item-list)
  ;; Return: (values filtered-items other-items)
  (assert (listp item-list))
  (loop for item in item-list
	if (funcall predicate item)
	  collect item into filtered-items
	else
	  collect item into other-items
	finally (return (values filtered-items other-items))))

(defun separate-args-by-type (type-predicate args)
  (assert (listp args))
  (separate-items
   (lambda (arg)
     (let ((var-type (second arg)))
       (funcall type-predicate var-type)))
   args))

(defun extract-string-args (args)
  (assert (listp args))
  (separate-args-by-type #'string-type-p args))

(defun extract-array-bindings (args)
  (assert (listp args))
  (separate-args-by-type #'array-type-p args))

(defun extract-pointer-type-args (args)
  (assert (listp args))
  (separate-args-by-type #'pointer-type-p args))


(defun build-new-array-bindings-for-foreign-funcalls (array-args &rest body)
  "rebind X,Y... with (with-arrays-as-foreign-arrays ((X X) (Y Y) ...) body)"
  `(with-arrays-as-foreign-arrays
       ,(mapcar (lambda (array-arg)
		  (list (first array-arg) (first array-arg)))
		array-args)
     ,@body))

(defun find-and-remove-all-out-parameters (args)
  ;; out param has the form: (var-name var-type :out) or (var-name var-type :in-out)
  (assert (listp args))
  (loop for arg in args
	if (member (car (last arg)) '(:out :in-out))
	  collect arg into out-params
	  and 
	    collect (butlast arg) into rest-params
	else
	  collect (list (first arg) (second arg)) into rest-params
	finally (return (values out-params rest-params))))

;;; defffun
;; TODO: reduce overhead
;; TODO: test passing structs
;; TODO: add type checking
;; TODO: add type declarations
(defmacro defffun (name-and-options return-type &rest args)
  ;; deal with out parameters
  (multiple-value-bind (out-parameters args)
      (find-and-remove-all-out-parameters args)
    ;; pick up immediate args and string args
    (labels ((process-args (args)
	       (multiple-value-bind (string-args other-args)
		   (extract-string-args args)
		 (multiple-value-bind (pointer-type-args other-args)
		     (extract-pointer-type-args other-args)
		   ;; other-args now contain all immediate values
		   (values other-args pointer-type-args string-args)))))
      (multiple-value-bind (lisp-name foreign-name options)
	  (cffi::parse-name-and-options name-and-options)
	(declare (ignorable lisp-name foreign-name options))
	;; generate function names
	(let* ((internal-lisp-name (intern (concatenate 'string "%" (symbol-name lisp-name))))
	       (foreign-name (concatenate 'string foreign-name "_"))
	       (docstring (when (stringp (car args)) (pop args))))
	  (multiple-value-bind (immediate-args pointer-args string-args)
	      (process-args args)
	    (assert (and (null (intersection immediate-args pointer-args :key #'first))
			 (null (intersection immediate-args string-args :key #'first))
			 (null (intersection pointer-args string-args :key #'first))))
	    ;; generate new var names and binding forms
	    (let* ((temp-arg-names (mapcar (lambda (binding)
					     (cons (first binding) (gensym (symbol-name (first binding)))))
					   immediate-args))
		   (temp-bindings (mapcar (lambda (name binding)
					    `(,(cdr name) ',(second binding)))
					  temp-arg-names immediate-args))
		   (temp-string-arg-names (mapcar (lambda (binding)
						    (cons (first binding) (gensym (symbol-name (first binding)))))
						  string-args))
		   (temp-string-bindings (mapcar (lambda (name binding)
						   (list (cdr name) (first binding)))
						 temp-string-arg-names string-args)))
	      ;; build string-handling, immediate-value-handling, array-handling forms
	      (labels ((build-body-with-foreign-objects-decls (&rest body)
			 `(cffi:with-foreign-objects ,temp-bindings
			    (setf
			     ,@(iter (for binding in immediate-args)
				     (for temp-var in temp-arg-names)
				     (if (not (member (second binding) '(complex-float complex-double)))
					 (progn
					   (collect `(cffi:mem-aref ,(cdr temp-var) ',(second binding)))
					   (collect `,(first binding)))
					 (progn
					   (collect `(cffi:foreign-slot-value ,(cdr temp-var) ',(second binding) 'realpart))
					   (collect `(realpart ,(first binding)))
					   (collect `(cffi:foreign-slot-value ,(cdr temp-var) ',(second binding) 'imagpart))
					   (collect `(imagpart ,(first binding)))))))
			    (locally ,@body)))
		       (build-body-with-foreign-strings-decls (&rest body)
			 `(cffi:with-foreign-strings ,temp-string-bindings
			    ,@body)) 
		       (substitute-args-with-temp-names (args)
			 (loop for arg in args
			       for temp-var-name = (or (cdr (assoc (first arg) temp-arg-names))
						       (cdr (assoc (first arg) temp-string-arg-names)))
			       if temp-var-name
				 collect temp-var-name
			       else
				 collect (first arg))) 
		       (build-new-array-bindings-for-foreign-funcalls (array-args &rest body)
			 `(with-arrays-as-foreign-arrays ,(mapcar (lambda (array-arg)
								    (list (first array-arg) (first array-arg)))
								  array-args)
			    ,@body))
		       (build-foreign-immediate-values-to-lisp-form (var-name var-type)
			 (cond ((member var-type '(complex-float complex-double))
				`(complex (cffi:foreign-slot-value ,var-name ',var-type 'realpart)
					  (cffi:foreign-slot-value ,var-name ',var-type 'imagpart)))
			       ((member var-type '(:char :string))
				`(cffi:foreign-string-to-lisp ,var-name))
			       (t
				`(cffi:mem-aref ,var-name ',var-type)))))
		;; build the body for lisp side
		(let* ((array-args (extract-array-bindings args))
		       (body (with-unique-names (result)
			       `(with-safe-foreign-function-call-settings
				  ;; deal with the return value if it's a complex-number
				  ;; also return out params as multiple values
				  ;; don't return nil if the return type of the function is :void
				  (let ((,result (,internal-lisp-name ,@(substitute-args-with-temp-names args))))
				    (declare (ignorable ,result))
				    (values
				      ,@(unless (eq return-type :void)
					  (if (or (string-type-p return-type)
						  (not (pointer-type-p return-type)))
					      `(,result)
					      `(,(build-foreign-immediate-values-to-lisp-form result return-type))))
				      ,@(loop for (var-name var-type out) in out-parameters
					      do (assert (member out '(:out :in-out)))
					      if (not (pointer-type-p var-type))
						collect (build-foreign-immediate-values-to-lisp-form
							 (or (cdr (assoc var-name temp-arg-names))
							     (cdr (assoc var-name temp-string-arg-names)))
							      var-type))))))))
		  (when array-args
		    (setf body (build-new-array-bindings-for-foreign-funcalls array-args body)))
		  (when string-args
		    (setf body (build-body-with-foreign-strings-decls body)))
		  (when immediate-args
		    (setf body (build-body-with-foreign-objects-decls body)))
		  ;; the final form
		  `(progn
		     (declaim (inline ,internal-lisp-name))
		     (cffi:defcfun (,internal-lisp-name ,foreign-name) ,return-type
		       ,@(mapcar (lambda (a) (list (first a) :pointer)) args))
		     (defun ,lisp-name ,(mapcar #'car args)
		       ,@(ensure-list docstring)
		       ,body)))))))))))
