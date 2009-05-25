(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew :test *features*))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:oos 'asdf:load-op :cffi)
  (asdf:oos 'asdf:load-op :alexandria))

(cl:defpackage :intel.mkl.blas
  (:use :cl :cffi :alexandria)
  (:nicknames :blas))

(in-package :blas)

;; (eval-when (:compile-toplevel :load-toplevel)
;;   (progn
;;     (load-foreign-library "libguide.so")
;;     (load-foreign-library "libiomp5.so")
;;     )
;;   (load-foreign-library "libmkl_core.so")
;;   (progn
;;     ;; (load-foreign-library "libmkl_sequential.so")
;;     (load-foreign-library "libmkl_gnu_thread.so")
;;     ;; (load-foreign-library "libmkl_intel_thread.so")
;;     )
;;   (load-foreign-library "libmkl_intel_lp64.so")
;;   (load-foreign-library "libmkl_mc.so")	; Intel Core Arch
;;   )

;; (eval-when (:compile-toplevel :load-toplevel)
;;   (load-foreign-library "libcblas.so.3"))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi:load-foreign-library "/home/huang/workspace/intel-mkl-wrapper/scratch/lapack_wrapper.so"))

(defun make-static-array (dimensions &key element-type initial-element initial-contents)
  #+allegro
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static-reclaimable))
  #+sbcl
  (progn
    (warn "SBCL does not support static array currently. Use them with macro with-arrays-as-foreign-arrays.")
    (apply #'make-array
	   `(,dimensions
	     :element-type ,element-type
	     ,@(when initial-element `(:initial-element ,initial-element))
	     ,@(when initial-contents `(:initial-contents ,initial-contents))))))

(defmacro with-arrays-as-foreign-arrays ((&rest array-vars) &body body)
  #+allegro
  `(locally ,@body)			;FIXME:
  #+sbcl
  `(sb-sys:with-pinned-objects ,(mapcar #'first array-vars)
     (let ,(mapcan (lambda (vars)
		     (let ((array-var (first vars))
			   (array-foreign-var (second vars))
			   (array-length-var (third vars)))
		       `((,array-length-var (array-total-size ,array-var))
			 (,array-foreign-var (sb-sys:vector-sap (SB-KERNEL:%WITH-ARRAY-DATA ,array-var 0 0))))))
	    array-vars)
       ,@body)))

#+test
(progn
 (setf *print-lines* 40)
 (progn
   (defparameter *a* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element pi))
   (defparameter *b* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 2d0))
   (defparameter *c* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 5d0))))


;;; ddot
(defcfun cblas-ddot :double
  (n :int)
  (x :pointer)
  (incf-x :int)
  (y :pointer)
  (incf-y :int))

(defun v*v (x y)
  (check-type x array)
  (check-type y array)
  (assert (= (length x) (length y)))
  (with-arrays-as-foreign-arrays ((x xf xlen) (y yf ylen))
    (cblas-ddot xlen xf 1 yf 1)))

;;; dgemm
(defcfun cblas-dgemm :void
  (order :int)
  (transa :int)
  (transb :int)
  (m :int)
  (n :int)
  (k :int)
  (alpha :double)
  (a :pointer)
  (lda :int)
  (b :pointer)
  (ldb :int)
  (beta :double)
  (c :pointer)
  (ldc :int))

(defun mm* (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (with-arrays-as-foreign-arrays ((a af alen) (b bf blen) (result resultf resultlen))
    (cblas-dgemm 101 111 111
		 (array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
		 1d0
		 af (array-dimension a 0)
		 bf (array-dimension b 0)
		 0d0
		 resultf (array-dimension result 0))
    result))


;;;; Test
;;; Compile and load this file,
;;; After that, just run:

;;; (in-package :blas)
;;; (time (mm* a b c))

;;; It crashed my lisp process after printing the timing result.


(defcfun my-dgemm :void
  (transa :char)
  (transb :char)
  (m :int)
  (n :int)
  (k :int)
  (alpha :double)
  (a :pointer)
  (lda :int)
  (b :pointer)
  (ldb :int)
  (beta :double)
  (c :pointer)
  (ldc :int))

(defun my-mm* (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (with-arrays-as-foreign-arrays ((a af alen) (b bf blen) (result resultf resultlen))
    (progn 				;sb-sys:without-interrupts
      (my-dgemm (char-code #\N) (char-code #\N)
		(array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
		1d0
		af (array-dimension a 0)
		bf (array-dimension b 0)
		0d0
		resultf (array-dimension result 0)))
    result))
