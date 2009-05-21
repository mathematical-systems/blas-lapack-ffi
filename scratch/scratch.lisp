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
    (load-foreign-library "libguide.so")
    (load-foreign-library "libiomp5.so")
    )
  (load-foreign-library "libmkl_core.so")
  (progn
    (load-foreign-library "libmkl_sequential.so")
    ;; (load-foreign-library "libmkl_gnu_thread.so")
    ;; (load-foreign-library "libmkl_intel_thread.so")
    )
  (load-foreign-library "libmkl_intel_lp64.so")
  (load-foreign-library "libmkl_mc.so")	; Intel Core Arch
  )

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
   (defparameter a (make-static-array (list 2000 2000) :element-type 'double-float :initial-element pi))
   (defparameter b (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 2d0))
   (defparameter c (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 5d0))))


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
  (cblas-ddot (length x) x 1 y 1))

;;; dgemm
(defcfun cblas-dgemm :pointer
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
  (cblas-dgemm 101 111 111
	       (array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
	       1d0
	       a (array-dimension a 0)
	       b (array-dimension b 0)
	       0d0
	       result (array-dimension result 0))
  result)

#|
(defun mm*-lisp (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (locally
      (declare (type (simple-array double-float (* *)) a b result)
	       (optimize (speed 3) (safety 0)))
    (let ((b-step (array-dimension b 1)))
      (declare (type fixnum b-step))
      (loop for i of-type fixnum below (array-dimension a 0)
	    do (loop for j of-type fixnum below (array-dimension b 1)
		     for a-offset of-type fixnum = (* b-step i)
		     for b-offset of-type fixnum = j
		     do (loop with sum of-type double-float = 0d0
			      for k of-type fixnum below (array-dimension b 0)
			      do (progn 
				   (incf sum (the double-float
					       (* (the double-float (row-major-aref a a-offset))
						  (the double-float (row-major-aref b b-offset)))))
				   (incf b-offset b-step))
			      finally (setf (aref result i j) sum)))))))


(defun mm*-lisp (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (locally
      (declare (type (simple-array double-float (* *)) a b result)
	       (optimize speed (safety 0)))
    (loop for i of-type fixnum below (array-dimension a 0)
	  do (loop for j of-type fixnum below (array-dimension b 1)
		   do (loop with sum of-type double-float = 0d0
			    for k of-type fixnum below (array-dimension a 1)
			    do (incf sum (the double-float
					   (* (the double-float (aref a i k))
					      (the double-float (aref b k j)))))
			    finally (setf (aref result i j) sum))))))
|#
