(in-package :msi.blas)


;;;; type definitions

(cffi:defctype blas-int
  #+blas-use-64bit-int :int64
  #-blas-use-64bit-int :int32)

(cffi:defcstruct (complex-float :conc-name complex-float-)
  (real :float)
  (img :float))

(cffi:defcstruct (complex-double :conc-name complex-double-)
  (real :double)
  (img :double))

(deftype complex-float () '(complex single-float))

;; (defmethod cffi:translate-to-foreign (c (type complex-float))
;;   )


;;;; Spec of function name conventions

(define-constant +precision-definitions+
    '((:single . (:abbrev "S" :cffi-type :float))
      (:double . (:abbrev "D" :cffi-type :double))
      (:complex-single . (:abbrev "C" :cffi-type complex-float))
      (:complex-double . (:abbrev "Z" :cffi-type complex-double)))
  :test 'equalp)

(define-constant +matrix-type-definitions+
    '((:general-matrix . (:abbrev "GE"))
      (:general-band-matrix . (:abbrev "GB"))
      (:symmetric-matrix . (:abbrev "SY"))
      (:symmetric-matrix-packed-storage . (:abbrev "SP"))
      (:symmetric-band-matrix . (:abbrev "SB"))
      (:Hermitian-matrix . (:abbrev "HE"))
      (:Hermitian-matrix-packed-storage . (:abbrev "HP"))
      (:Hermitian-band-matrix . (:abbrev "HB"))
      (:triangular-matrix . (:abbrev "TR"))
      (:triangular-matrix-packed-storage . (:abbrev "TP"))
      (:abbrev (:triangular-band-matrix . "TB")))
  :test 'equalp)

;;;; utilities

(defmacro defblas (name precisions return-type &body body)
  (assert (or (member precisions +precision-definitions+ :key #'car)
	      (and (listp precisions)
		   (every (lambda (p) (member p +precision-definitions+ :key #'car)) precisions)))
	  nil
	  "Precisions = ~a, is not a recognized value."
	  precisions)
  (let ((precisions (ensure-list precisions))) 
    `(progn
       ,@(loop for p in precisions
	       for function-name = (symbolicate (getf (cdr (assoc p +precision-definitions+)) :abbrev) name)
	       do (assert (cffi:foreign-symbol-pointer
			   (concatenate 'string
					(nth-value 1 (cffi::parse-name-and-options function-name))
					"_"))
			  nil
			  "Cannot resolve foreign function symbol (~a)"
			  (nth-value 1 (cffi::parse-name-and-options function-name)))
	       collect `(progn
			  (defffun ,function-name ,(if (eq return-type :precision)
						      #1=(getf (cdr (assoc p +precision-definitions+)) :cffi-type)
						      return-type)
			   ,@(subst #1# :precision body))
			  (export ',function-name))))))

;;;; blas1

;;; asum
(defblas asum (:single :double)
    :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int))

(defffun scasum :float
  (n blas-int)
  (x (:array :complex-single *))
  (incx blas-int))

(defffun dzasum :double
  (n blas-int)
  (x (:array :complex-double *))
  (incx blas-int))

;;; axpy
(defblas axpy (:single :double :complex-single :complex-double)
    :void
  (n blas-int)
  (a :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; copy
(defblas copy (:single :double :complex-single :complex-double)
    :void
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; dot
(defblas dot (:single :double)
    :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; sdsdot, dsdot
(defffun sdsdot :float
  (n blas-int)
  (sb :float)
  (sx (:array :float *))
  (incx blas-int)
  (sy (:array :float *))
  (incy blas-int))

(defffun dsdot :double
  (n blas-int)
  (sx (:array :float *))
  (incx blas-int)
  (sy (:array :float *))
  (incy blas-int))

;;; dotc
(defblas dotc (:complex-single :complex-double)
    :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))


;;;; blas2



;;;; blas 3
(defffun dgemm :void
  (transa :char)
  (transb :char)
  (m :int)
  (n :int)
  (k :int)
  (alpha :double)
  (a (:array :double *))
  (lda :int)
  (b (:array :double *))
  (ldb :int)
  (beta :double)
  (c (:array :double *))
  (ldc :int))

(defun mm* (a b result)
  (check-type a array)
  (check-type b array)
  (check-type result array)
  (assert (and (= (array-dimension a 1) (array-dimension b 0))
	       (= (array-dimension a 0) (array-dimension result 0))
	       (= (array-dimension b 1) (array-dimension result 1))))
  (dgemm "N" "N"
	 (array-dimension a 0) (array-dimension a 1) (array-dimension b 1)
	 1d0
	 a (array-dimension a 0)
	 b (array-dimension b 0)
	 0d0
	 result (array-dimension result 0))
  result)

