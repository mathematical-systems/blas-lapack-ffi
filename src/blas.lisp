(in-package :msi.blas)


;;;; type definitions

(cffi:defctype blas-int
  #+blas-use-64bit-int :int64
  #-blas-use-64bit-int :int32)


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

(define-constant +evaluation-form+
    '(if when cond case)
  :test 'equalp)

(defmacro %defblas (name return-type &rest args)
  (labels ((evaluate-forms (form)
	     (cond ((not (listp form))
		    form)
		   ((member (first form) +evaluation-form+)
		    (eval form))
		   (t
		    (mapcar #'evaluate-forms form)))))
    (let ((result
	   `(defffun ,name
		,(evaluate-forms return-type)
	      ,@(evaluate-forms args))))
      ;; clean up
      (loop for p in (mapcar #'car +precision-definitions+)
	    do (setf result (subst (getf (cdr (assoc p +precision-definitions+)) :cffi-type) p result)))
      result)))

(defmacro defblas (name precisions return-type &rest args)
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
	       collect `(%defblas ,function-name
				  ,(if (eq return-type :precision)
				       p
				       return-type)
				  ,@(subst p :precision args))
	       collect `(export ',function-name)))))

;;;; blas1
;;; TODO: rotg rotmg

;;; asum
(defblas asum (:single :double) :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int))

(defffun scasum :float
  (n blas-int)
  (x (:array complex-float *))
  (incx blas-int))

(defffun dzasum :double
  (n blas-int)
  (x (:array complex-double *))
  (incx blas-int))

;;; axpy
(defblas axpy (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (a :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; copy
(defblas copy (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; dot
(defblas dot (:single :double) :precision
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
(defblas dotc (:complex-single :complex-double) :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; dotu
(defblas dotu (:complex-single :complex-double) :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; nrm2
(defblas nrm2 (:single :double) :precision
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int))

(defffun scnrm2 :float
  (n blas-int)
  (x (:array complex-float *))
  (incx blas-int))

(defffun dznrm2 :double
  (n blas-int)
  (x (:array complex-double *))
  (incx blas-int))

;;; rot
(defblas rot (:single :double) :void
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (c :precision)
  (s :precision))

;; FIXME: cause SBCL to crash
(defffun csrot :void
  (n blas-int)
  (x (:array complex-float *))
  (incx blas-int)
  (y (:array complex-float *))
  (incy blas-int)
  (c :float)
  (s :float))

;; FIXME: cause SBCL to crash
(defffun zdrot :void
  (n blas-int)
  (x (:array complex-double *))
  (incx blas-int)
  (y (:array complex-double *))
  (incy blas-int)
  (c :double)
  (s :double))

;;; rotm
(defblas rotm (:single :double) :void
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (param (:array :precision 5)))

;;; scal
(defblas scal (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (a :precision)
  (x (:array :precision *))
  (incx blas-int))

;;; swap
(defblas swap (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int))

;;; i?amax
;;; it's generated and modified from
;; (defblas amax (:single :double :complex-single :complex-double)
;;     :precision
;;   (n blas-int)
;;   (x (:array :precision *))
;;   (incx blas-int))
(PROGN
  (DEFFFUN iSAMAX :FLOAT
    (N BLAS-INT)
    (X (:ARRAY :FLOAT *))
    (INCX BLAS-INT))
  (EXPORT 'iSAMAX)
  (DEFFFUN iDAMAX :DOUBLE
    (N BLAS-INT)
    (X (:ARRAY :DOUBLE *))
    (INCX BLAS-INT))
  (EXPORT 'iDAMAX)
  (DEFFFUN iCAMAX COMPLEX-FLOAT
    (N BLAS-INT)
    (X (:ARRAY COMPLEX-FLOAT *))
    (INCX BLAS-INT))
  (EXPORT 'iCAMAX)
  (DEFFFUN iZAMAX COMPLEX-DOUBLE
    (N BLAS-INT)
    (X (:ARRAY COMPLEX-DOUBLE *))
    (INCX BLAS-INT))
  (EXPORT 'iZAMAX))

;;; i?amin
;;; it's generated and modified from
;; (defblas amin (:single :double :complex-single :complex-double)
;;     :precision
;;   (n blas-int)
;;   (x (:array :precision *))
;;   (incx blas-int))
(PROGN
  (DEFFFUN iSAMIN :FLOAT
    (N BLAS-INT)
    (X (:ARRAY :FLOAT *))
    (INCX BLAS-INT))
  (EXPORT 'iSAMIN)
  (DEFFFUN iDAMIN :DOUBLE
    (N BLAS-INT)
    (X (:ARRAY :DOUBLE *))
    (INCX BLAS-INT))
  (EXPORT 'iDAMIN)
  (DEFFFUN iCAMIN COMPLEX-FLOAT
    (N BLAS-INT)
    (X (:ARRAY COMPLEX-FLOAT *))
    (INCX BLAS-INT))
  (EXPORT 'iCAMIN)
  (DEFFFUN iZAMIN COMPLEX-DOUBLE
    (N BLAS-INT)
    (X (:ARRAY COMPLEX-DOUBLE *))
    (INCX BLAS-INT))
  (EXPORT 'iZAMIN))

;;; cabs1
(defblas cabs1 (:double) :double
  (z :complex-double))



;;;; blas2

;;; gbmv
(defblas gbmv (:single :double :complex-single :complex-double) :void
  (trans :string)
  (m blas-int)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x :precision)
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; gemv
(defblas gemv (:single :double :complex-single :complex-double) :void
  (trans :string)
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x :precision)
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; ger
(defblas ger (:single :double) :void
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; gerc
(defblas gerc (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; geru
(defblas geru (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; hbmv
(defblas hbmv (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; hemv
(defblas hemv (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; her
(defblas her (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (alpha (case :precision
	   (:complex-single :single)
	   (:complex-double :double)))
  (x (:array :precision *))
  (incx blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; her2
(defblas her2 (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; hpmv
(defblas hpmv (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (ap (:array :precision *))
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; hpr
(defblas hpr (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (alpha (case :precision
	   (:complex-single :single)
	   (:complex-double :double)))
  (x (:array :precision *))
  (incx blas-int)
  (ap (:array :precision *)))

;;; hpr2
(defblas hpr2 (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (ap (:array :precision *)))

;;; sbmv
(defblas sbmv (:single :double) :void
  (uplo :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; spmv
(defblas spmv (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (ap (:array :precision *))
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; spr
(defblas spr (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (ap (:array :precision *)))

;;; spr2
(defblas spr2 (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (ap (:array :precision *)))

;;; symv
(defblas symv (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int)
  (beta :precision)
  (y (:array :precision *))
  (incy blas-int))

;;; syr
(defblas syr (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (a (:array :precision * *))
  (lda blas-int))

;;; syr2
(defblas syr2 (:single :double) :void
  (uplo :string)
  (n blas-int)
  (alpha :precision)
  (x (:array :precision *))
  (incx blas-int)
  (y (:array :precision *))
  (incy blas-int)
  (a (:array :precision *))
  (lda blas-int))

;;; tbmv
(defblas tbmv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int))

;;; tbsv
(defblas tbsv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int))

;;; tpmv
(defblas tpmv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (ap (:array :precision *))
  (x (:array :precision *))
  (incx blas-int))

;;; tpsv
(defblas tpsv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (ap (:array :precision *))
  (x (:array :precision *))
  (incx blas-int))

;;; trmv
(defblas trmv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int))

;;; trsv
(defblas trsv (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (x (:array :precision *))
  (incx blas-int))



;;;; blas 3

;;; gemm
(defblas gemm (:single :double :complex-single :complex-double) :void
  (transa :string)
  (transb :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (beta :precision)
  (c (:array :precision * *))
  (ldc blas-int))

;;; hemm
(defblas hemm (:complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (beta :precision)
  (c (:array :precision * *))
  (ldc blas-int))

;;; herk
(defblas herk (:complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (n blas-int)
  (k blas-int)
  (alpha (case :precision
	   (:complex-single :single)
	   (:complex-double :double)))
  (a (:array :precision * *))
  (lda blas-int)
  (beta (case :precision
	  (:complex-single :single)
	  (:complex-double :double)))
  (c (:array :precision * *))
  (ldc blas-int))

;;; her2k
(defblas her2k (:complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (beta :precision)
  (b (:array :precision * *))
  (ldb blas-int)
  (c (:array :precision * *))
  (ldc blas-int))

;;; symm
(defblas symm (:single :double :complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (beta :precision)
  (c (:array :precision * *))
  (ldc blas-int))

;;; syrk
(defblas syrk (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (beta :precision)
  (c (:array :precision * *))
  (ldc blas-int))

;;; syrk2
(defblas syr2k (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (n blas-int)
  (k blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (beta :precision)
  (c (:array :precision * *))
  (ldc blas-int))

;;; trmm
(defblas trmm (:single :double :complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (transa :string)
  (diag :string)
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int))

;;; trsm
(defblas trsm (:single :double :complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (transa :string)
  (diag :string)
  (m blas-int)
  (n blas-int)
  (alpha :precision)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int))


