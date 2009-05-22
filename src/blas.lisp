(in-package :msi.blas)


;;;; Spec of function name conventions

(define-constant +precision-indicators+
    '((:single . "s")
      (:double . "d")
      (:complex-single . "c")
      (:complex-double . "z"))
  :test 'equalp)

(define-constant +matrix-type-indicators+
    '((:general-matrix . "ge")
      (:general-band-matrix . "gb")
      (:symmetric-matrix . "sy")
      (:symmetric-matrix-packed-storage . "sp")
      (:symmetric-band-matrix . "sb")
      (:Hermitian-matrix . "he")
      (:Hermitian-matrix-packed-storage . "hp")
      (:Hermitian-band-matrix . "hb")
      (:triangular-matrix . "tr")
      (:triangular-matrix-packed-storage . "tp")
      (:triangular-band-matrix . "tb"))
  :test 'equalp)

;;;; utilities


;;;; blas1


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

