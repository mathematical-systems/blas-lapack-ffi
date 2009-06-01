(in-package :msi.ffi-utils)


;;; TYPE: foreign complex type declaration
(cffi:defcstruct complex-float
  (realpart :float)
  (imagpart :float))

(cffi:defcstruct complex-double
  (realpart :double)
  (imagpart :double))


;;; FUNCTION: make-static-array
(defun make-static-array (dimensions &key element-type initial-element initial-contents (warning t))
  #+allegro
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static-reclaimable))
  #+sbcl
  (progn
    (when warning
      (warn "SBCL does not support static array currently. Use them with macro with-arrays-as-foreign-arrays and turn of GC during foreign funcalls (e.g. sb-sys:without-gcing)."))
    (apply #'make-array
	   `(,dimensions
	     :element-type ,element-type
	     ,@(when initial-element `(:initial-element ,initial-element))
	     ,@(when initial-contents `(:initial-contents ,initial-contents)))))
  #+lispworks
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static))
  )


;;; MACRO: with-safe-foreign-function-call-settings
(defmacro with-safe-foreign-function-call-settings (&body body)
  #+allegro
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
  #+allegro
  `(locally ,@body)			;FIXME:
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
    (apply #'build-exp array-bindings body)))

;;; MACRO: defcfun for C functions and defffun for Fortran functions
;;; TODO: add support for complex type
;;; FIXME: fix parse-type
(defmacro defcfun (name-and-options return-type &rest args)
  (multiple-value-bind (lisp-name foreign-name options)
      (cffi::parse-name-and-options name-and-options)
    (declare (ignorable lisp-name foreign-name options))
    (let* ((internal-lisp-name (intern (concatenate 'string "%" (symbol-name lisp-name))))
	   (docstring (when (stringp (car args)) (pop args))))
      (labels ((extract-array-bindings (args)
		 (loop for (var-name var-type) in args
		       if (let ((parsed-type (type-of (cffi::parse-type var-type))))
			    (or (and (listp var-type)
				     (eq (first var-type) :array))
				(and (or (eq parsed-type 'cffi::foreign-typedef)
					 (eq parsed-type 'cffi::enhanced-typedef))
				     (eq (type-of (cffi::actual-type (cffi::parse-type var-type)))
					 'cffi::foreign-array-type))))
			 collect (list var-name var-type) into array-args
		       else
			 collect (list var-name var-type) into other-args
		       finally (return (values array-args other-args))))
	       (build-new-array-bindings-for-foreign-funcalls (array-args &rest body)
		 `(with-arrays-as-foreign-arrays ,(mapcar (lambda (array-arg)
							    (list (first array-arg) (first array-arg)))
							  array-args)
		    ,@body)))
	(let* ((array-args (extract-array-bindings args))
	       (body `(with-safe-foreign-function-call-settings
			  (,internal-lisp-name ,@(mapcar #'car args))))
	       (args (loop for (var-name var-type) in args
			   if (let ((parsed-type (type-of (cffi::parse-type var-type))))
				(or (and (listp var-type)
					 (eq (first var-type) :array))
				    (and (or (eq parsed-type 'cffi::foreign-typedef)
					     (eq parsed-type 'cffi::enhanced-typedef))
					 (eq (type-of (cffi::actual-type (cffi::parse-type var-type)))
					     'cffi::foreign-array-type))))
			     collect (list var-name :pointer)
			   else
			     collect (list var-name var-type))))
	  (when array-args
	    (setf body (build-new-array-bindings-for-foreign-funcalls array-args body)))
	  `(progn
	     (declaim (inline ,internal-lisp-name))
	     (cffi:defcfun (,internal-lisp-name ,foreign-name) ,return-type ,@args)
	     (defun ,lisp-name ,(mapcar #'car args)
	       ,@(ensure-list docstring)
	       ,body)))))))


;;; MACRO: defcfun for fortran calling convention

;;; NOTE: returns all the out params and the return value in multiple
;;; values, the first is the return value. If it's a fortran
;;; subroutine which means the return type is :void, it may not return
;;; any value.

;; NOTE: always pass a string to either :char and :string parameters

;;; TODO: test passing structs
;;; TODO: reduce overhead
;;; TODO: add type checking
;;; TODO: add type declarations
(defmacro defffun (name-and-options return-type &rest args)
  ;; deal with out parameters
  (labels ((find-and-remove-all-out-parameters (args)
	     ;; out param has the form: (var-name var-type :out)
	     ;; e.g. (alpha :double :out)
	     (loop for arg in args
		   if (member (car (last arg)) '(:out :in-out))
		     collect arg into out-params
		     and 
		       collect (butlast arg) into cffi-params
		   else
		     collect (list (first arg) (second arg)) into cffi-params
		   finally (return (values out-params cffi-params)))))
    (multiple-value-bind (out-parameters args)
	(find-and-remove-all-out-parameters args)
      ;; pick up immediate args and string args
      (labels ((string-type-p (var-type)
		 ;; a string var has type (or :char :string)
		 (member var-type '(:char :string)))
	       (pointer-type-p (var-type)
		 ;; NOTE: a pointer var has :pointer as the canonical type.
		 ;; here complexes are the special cases since it's defined as c structs. 
		 (and (not (string-type-p var-type))
		      (not (member var-type '(complex-float complex-double)))
		      (eq (cffi::canonicalize-foreign-type var-type) :pointer)))
	       (extract-pass-by-reference-args (args)
		 (loop for (var-name var-type) in args
		       if (pointer-type-p var-type)
			 collect (list var-name var-type) into pass-by-reference-args
		       else
			 collect (list var-name var-type) into other-args
		       finally (return (values pass-by-reference-args other-args))))
	       (extract-string-args (args)
		 (loop for (var-name var-type) in args
		       if (string-type-p var-type)
			 collect (list var-name var-type) into string-args
		       else
			 collect (list var-name var-type) into other-args
		       finally (return (values string-args other-args))))
	       (process-args (args)
		 (multiple-value-bind (string-args other-args)
		     (extract-string-args args)
		   (multiple-value-bind (pass-by-reference-args other-args)
		       (extract-pass-by-reference-args other-args)
		     ;; other-args now contain all immediate values
		     (values other-args pass-by-reference-args string-args)))))
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
			 (extract-array-bindings (args)
			   (loop for (var-name var-type) in args
				 if (let ((var-type (ensure-list var-type)))
				      (eq (first var-type) :array))
				   collect (list var-name var-type) into array-args
				 else
				   collect (list var-name var-type) into other-args
				 finally (return (values array-args other-args))))
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
			 ,body))))))))))))
