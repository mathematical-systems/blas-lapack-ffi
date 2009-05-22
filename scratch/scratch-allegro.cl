(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew :test *features*))

(cl:defpackage :intel.mkl.blas
    (:use :cl)
  (:nicknames :blas))

(in-package :blas)

;; (eval-when (:compile-toplevel :load-toplevel)
;;   (progn
;;     (load "libguide.so" :foreign t)
;;     (load "libiomp5.so" :foreign t)
;;     )
;;   (load "libmkl_core.so" :foreign t)
;;   (progn
;;     ;; (load "libmkl_sequential.so" :foreign t)
;;     (load "libmkl_gnu_thread.so" :foreign t)
;;     ;; (load "libmkl_intel_thread.so" :foreign t)
;;     )
;;   (load "libmkl_intel_lp64.so" :foreign t)
;;   (load "libmkl_mc.so" :foreign t)	; Intel Core Arch
;;   )

;;; for test
;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;   (load-foreign-library "libcblas.so.3"))

(eval-when (:compile-toplevel :load-toplevel)
  (load "/home/huang/workspace/intel-mkl-wrapper/scratch/lapack_wrapper.so"))

(defun make-static-array (dimensions &key element-type initial-element initial-contents)
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static-reclaimable)))

#+test
(progn
  (setf *print-lines* 40)
  (progn
    (defparameter *a* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element pi))
    (defparameter *b* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 2d0))
    (defparameter *c* (make-static-array (list 2000 2000) :element-type 'double-float :initial-element 5d0))))


;;; dgemm
(ff:def-foreign-call my-dgemm ((transa :char)
			       (transb :char)
			       (m :int)
			       (n :int)
			       (k :int)
			       (alpha :double)
			       (a (:array (:array :double)))
			       (lda :int)
			       (b (:array (:array :double)))
			       (ldb :int)
			       (beta :double)
			       (c (:array (:array :double)))
			       (ldc :int))
  :convention :c
  :returning :void
  :strings-convert t)

(defun mm* (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (my-dgemm #\N #\N
	    (array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
	    1d0
	    a (array-dimension a 0)
	    b (array-dimension b 0)
	    0d0
	    result (array-dimension result 0))
  result)


;;;; Test
;;; Compile and load this file,
;;; After that, just run:

;;; (in-package :blas)
;;; (time (mm* a b c))

;;; It crashed my lisp process after printing the timing result.


(deftype array-index () `(mod #.array-dimension-limit))

(defun mm*-lisp (a b result)
  (declare (type (simple-array double-float (* *)) a b result) 
	   (optimize speed (safety 0)))
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (loop for i of-type array-index below (array-dimension a 0)
	do (loop for j of-type array-index below (array-dimension b 1)
		 do (loop with sum of-type double-float = 0d0
			  for k of-type array-index below (array-dimension a 1)
			  do (locally
				 (declare (fixnum i j k))
			       (let* ((av (aref a i k))
				      (bv (aref b k j)))
				 (declare (type double-float av bv))
				 (incf sum (* av bv))))
			  finally (setf (aref result i j) sum)))))

