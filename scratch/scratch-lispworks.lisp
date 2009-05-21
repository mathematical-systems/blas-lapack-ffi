(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew :test *features*))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:oos 'asdf:load-op :cffi)
  (asdf:oos 'asdf:load-op :alexandria))

(cl:defpackage :intel.mkl.blas
  (:use :cl :cffi :alexandria)
  (:nicknames :blas))

(in-package :blas)

(eval-when (:compile-toplevel :load-toplevel)
  (progn
    (fli:register-module "libguide.so" :connection-style :immediate :dlopen-flags :global-lazy)
    (fli:register-module "libiomp5.so" :connection-style :immediate :dlopen-flags :global-lazy))
  (fli:register-module "libm.so" :connection-style :immediate :dlopen-flags :global-lazy)
  (fli:register-module "libmkl_core.so" :connection-style :immediate :dlopen-flags :global-lazy)
  (progn
    ;; (fli:register-module "libmkl_sequential.so" :connection-style :immediate :dlopen-flags :global-lazy)
    (fli:register-module "libmkl_gnu_thread.so" :connection-style :immediate :dlopen-flags :global-lazy)
    ;; (fli:register-module "libmkl_intel_thread.so" :connection-style :immediate :dlopen-flags :global-lazy)
    )
  (fli:register-module "libmkl_intel_lp64.so" :connection-style :immediate :dlopen-flags :global-lazy)
  (fli:register-module "libmkl_mc.so" :connection-style :immediate :dlopen-flags :global-lazy))

;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;   (load-foreign-library "libcblas.so.3"))

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
	     ,@(when initial-contents `(:initial-contents ,initial-contents)))))
  #+lispworks
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static)))

#+test
(progn
 (setf *print-lines* 40)
 (progn
   (defparameter a (make-static-array (list 2000 2000) :element-type 'double-float :initial-element (float pi 0d0)))
   (defparameter b (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 2d0))
   (defparameter c (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 5d0))))

;;; sgemm
(fli:define-foreign-function cblas-sgemm
    ((order :int)
     (transa :int)
     (transb :int)
     (m :int)
     (n :int)
     (k :int)
     (alpha :float)
     (a :pointer)
     (lda :int)
     (b :pointer)
     (ldb :int)
     (beta :float)
     (c :pointer)
     (ldc :int))
  :result-type :pointer
  :language :ansi-c)

;;; dgemm
(fli:define-foreign-function cblas-dgemm
    ((order :int)
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
  :result-type :pointer
  :language :ansi-c)

(defun mm* (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (fli:with-dynamic-lisp-array-pointer (a-ptr a) 
    (fli:with-dynamic-lisp-array-pointer (b-ptr b)
      (fli:with-dynamic-lisp-array-pointer (result-ptr result)
	(cblas-dgemm 101 111 111
		     (array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
		     1d0
		     a-ptr (array-dimension a 0)
		     b-ptr (array-dimension b 0)
		     0d0
		     result-ptr (array-dimension result 0)))))
  result)


