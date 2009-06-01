(defpackage :msi.blas.test
    (:use :cl :msi.ffi-utils :msi.blas :iterate :stefil))

(in-package :msi.blas.test)

;;; utility functions
(labels ((one-value (element-type rmax rmin)
	   (cond ((member element-type '(single-float double-float integer fixnum))
		  (coerce (+ rmin (random (- rmax rmin))) element-type))
		 ((and (listp element-type)
		       (eq (first element-type) 'complex))
		  (complex (coerce (+ rmin (random (- rmax rmin))) (second element-type))
			   (coerce (+ rmin (random (- rmax rmin))) (second element-type))))
		 (t
		  (error "element-type (~a) not recognized." element-type)))))

  ;; make-random-array
  (defun make-random-array (dimensions
			    &key
			    (element-type 'double-float)
			    (rmax 100)
			    (rmin 0))
    (let* ((arr (make-static-array dimensions :element-type element-type))
	   (total-size (array-total-size arr)))
      (loop for i fixnum below total-size
	    do (setf (row-major-aref arr i) (one-value element-type rmax rmin)))
      arr))

  ;; make-random-symmetric-matrix
  (defun make-random-symmetric-matrix (n &key
					 (element-type 'double-float)
					 (rmax 100)
					 (rmin 0))
    (let ((a (make-static-array (list n n) :element-type element-type)))
      (loop for i fixnum from 0 to (- n 1) do
	(loop for j fixnum from i to (- n 1) do
	  (setf (aref a i j) (one-value element-type rmax rmin))
	  (unless (= i j)
	    (setf (aref a j i) (aref a i j)))))
      a))

  ;; setup-array
  (defun setup-array (array &key (step 1) (rstart 0) (rstep 1))
    (loop for i fixnum below (array-total-size array) by step
	  do (progn
	       (setf (row-major-aref array i)
		     (coerce rstart (array-element-type array)))
	       (incf rstart rstep)))
    array))

;;; data
(defparameter *sx10* (setup-array (make-static-array 10 :element-type 'single-float :warning nil)))
(defparameter *dx10* (setup-array (make-static-array 10 :element-type 'double-float :warning nil)))
(defparameter *cx10* (setup-array (make-static-array 10 :element-type '(complex single-float) :warning nil)
				  :rstep #c(1 2)))
(defparameter *zx10* (setup-array (make-static-array 10 :element-type '(complex double-float) :warning nil)
				  :rstep #c(1 2)))
(defparameter *sy10* (setup-array (make-static-array 10 :element-type 'single-float :warning nil)
				  :rstep -2 :rstart 18))
(defparameter *dy10* (setup-array (make-static-array 10 :element-type 'double-float :warning nil)
				  :rstep -2 :rstart 18))
(defparameter *cy10* (setup-array (make-static-array 10 :element-type '(complex single-float) :warning nil)
				  :rstart #c(18 0) :rstep #c(-2 -1)))
(defparameter *zy10* (setup-array (make-static-array 10 :element-type '(complex double-float) :warning nil)
				  :rstart #c(18 0) :rstep #c(-2 -1)))

(defun setup-test-data ()
  (setup-array *sx10*)
  (setup-array *dx10*)
  (setup-array *cx10* :rstep #c (1 2))
  (setup-array *zx10* :rstep #c (1 2))
  (setup-array *sy10* :rstep -2 :rstart 18)
  (setup-array *dy10* :rstep -2 :rstart 18)
  (setup-array *cy10* :rstep #c (-2 -1) :rstart #c (18 0))
  (setup-array *zy10* :rstep #c (-2 -1) :rstart #c (18 0)))


;;; blas1 test
(deftest blas1-test ()
  (setup-test-data)
  ;; asum
  (is (= 45 (sasum 10 *sx10* 1)))
  (is (= 45 (dasum 10 *dx10* 1)))
  (is (= 135 (scasum 10 *cx10* 1)))
  (is (= 135 (dzasum 10 *zx10* 1)))
  (is (= 20 (sasum 5 *sx10* 2)))
  (is (= 10 (dasum 5 *dx10* 1)))
  ;; axpy
  (is (equalp #(18 17 16 15 14 13 12 11 10 9)
	      (progn
		(setup-test-data)
		(saxpy 10 1.0 *sx10* 1 *sy10* 1)
		*sy10*)))
  (is (equalp #(18 17 16 15 14 13 12 11 10 9)
	      (progn
		(setup-test-data)
		(daxpy 10 1.0d0 *dx10* 1 *dy10* 1)
		*dy10*)))
  (is (equalp #(#c(18 0) #c(17 1) #c(16 2) #c(15 3) #c(14 4) #c(13 5) #c(12 6) #c(11 7) #c(10 8) #c(9 9))
	      (progn
		(setup-test-data)
		(caxpy 10 1.0 *cx10* 1 *cy10* 1)
		*cy10*)))
  (is (equalp #(#c(18 0) #c(17 1) #c(16 2) #c(15 3) #c(14 4) #c(13 5) #c(12 6) #c(11 7) #c(10 8) #c(9 9))
	      (progn
		(setup-test-data)
		(zaxpy 10 1.0d0 *zx10* 1 *zy10* 1)
		*zy10*)))
  (is (equalp #(18 18 18 18 18 18 18 18 2 0)
	      (progn
		(setup-test-data)
		(daxpy 8 2.0d0 *dx10* 1 *dy10* 1)
		*dy10*)))
  (is (equalp #(18 16 18 12 18 8 18 4 2 0)
	      (progn
		(setup-test-data)
		(daxpy 4 2.0d0 *dx10* 2 *dy10* 2)
		*dy10*)))
  ;; TODO: copy
  )


;;; Unused: defixture 

