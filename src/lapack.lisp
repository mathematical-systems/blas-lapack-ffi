(in-package :msi.lapack)


;;;;;; LAPACK routines: Linear Equations

;;;;; computational routines

;;;; routine for matrix factorization

;;; getrf
(deflapack getrf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *) :in-out)
  (info blas-int :out))

;;; gbtrf
(deflapack gbtrf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (ipiv (:array blas-int *) :in-out)
  (info blas-int :out))

;;; gttrf
(deflapack gttrf (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (dl (:array :precision *) :in-out)
  (d (:array :precision *) :in-out)
  (du (:array :precision *) :in-out)
  (du2 (:array :precision *) :in-out)
  (ipiv (:array blas-int *) :in-out)
  (info blas-int :out))

;;; potrf
(deflapack potrf (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (info blas-int :out))

;;; pptrf 
(deflapack pptrf (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (info blas-int :out))

;;; pbtrf
(deflapack pbtrf (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (info blas-int :out))

;;; pttrf
(deflapack pttrf (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e :precision :in-out)
  (info blas-int :out))

;;; sytrf
(deflapack sytrf (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; hetrf
(deflapack hetrf (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; sptrf
(deflapack sptrf (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (ipiv (:array blas-int *) :in-out)
  (info blas-int :out))

;;; hptrf
(deflapack hptrf (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (ipiv (:array blas-int *) :in-out)
  (info blas-int :out))


;;;; routines for solving systems of linear equations

;;; getrs
(deflapack getrs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; gbtrs
(deflapack gbtrs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; gttrs
(deflapack gttrs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (nrhs blas-int)
  (dl (:array :precision *))
  (d (:array :precision *))
  (du (:array :precision *))
  (du2 (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; potrs
(deflapack potrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; pptrs
(deflapack pptrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; pbtrs
(deflapack pbtrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; pttrs
(deflapack pttrs (:single :double) :void
  (n blas-int)
  (nrhs blas-int)
  (d (:array :precision *))
  (e (:array :precision *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

(deflapack pttrs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (:array :precision *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; sytrs
(deflapack sytrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out)) 

;;; hetrs
(deflapack hetrs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; sptrs
(deflapack sptrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; hptrs
(deflapack hptrs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; trtrs
(deflapack trtrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; tptrs
(deflapack tptrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))

;;; tbtrs
(deflapack tbtrs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (kd blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (info blas-int :out))


;;;; routine for estimating the condition number

;;; gecon
(deflapack gecon (:single :double :complex-single :complex-double) :void
  (norm :string)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array blas-int *))))
  (info blas-int :out))

;;; gbcon
(deflapack gbcon (:single :double :complex-single :complex-double) :void
  (norm :string)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array blas-int *))))
  (info blas-int :out)) 

;;; gtcon
(deflapack gtcon (:single :double) :void
  (norm :string)
  (n blas-int)
  (dl (:array :precision *))
  (d (:array :precision *))
  (du (:array :precision *))
  (du2 (:array :precision *))
  (ipiv (:array blas-int *))
  (anorm :precision)
  (rcond :precision :out)
  (work (:array :precision *))
  (iwork (:array blas-int *))
  (info blas-int :out))

(deflapack gtcon (:complex-single :complex-double) :void
  (norm :string)
  (n blas-int)
  (dl (:array :precision *))
  (d (:array :precision *))
  (du (:array :precision *))
  (du2 (:array :precision *))
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (info blas-int :out))

;;; pocon
(deflapack pocon (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; ppcon
(deflapack ppcon (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; pbcon
(deflapack pbcon (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; ptcon
(deflapack ptcon (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (:array :precision *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (info blas-int :out))

;;; sycon
(deflapack sycon (:single :double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *))
  (ldab blas-int)
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (iwork (:array blas-int *))
  (info blas-int :out))

(deflapack sycon (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *))
  (ldab blas-int)
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (info blas-int :out))

;;; hecon
(deflapack hecon (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *))
  (ldab blas-int)
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (info blas-int :out))

;;; spcon
(deflapack spcon (:single :double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (iwork (:array blas-int *))
  (info blas-int :out))

(deflapack spcon (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (info blas-int :out))

;;; hpcon
(deflapack hpcon (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (ipiv (:array blas-int *))
  (anorm (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision)))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (info blas-int :out))

;;; trcon
(deflapack trcon (:single :double :complex-single :complex-double) :void
  (norm :string)
  (uplo :string)
  (diag :string)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; tpcon
(deflapack tpcon (:single :double :complex-single :complex-double) :void
  (norm :string)
  (uplo :string)
  (diag :string)
  (n blas-int)
  (ap (:array :precision *))
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; tbcon
(deflapack tbcon (:single :double :complex-single :complex-double) :void
  (norm :string)
  (uplo :string)
  (diag :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (rcond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))


;;;; refining solutions and estimating its error
(deflapack gerfs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (ldab blas-int)
  (af (:array :precision * *))
  (ldaf blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out)) 

;;; gbrfs
(deflapack gbrfs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (afb (:array :precision * *))
  (ldafb blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; gtrfs
(deflapack gtrfs (:single :double :complex-single :complex-double) :void
  (trans :string)
  (n blas-int)
  (nrhs blas-int)
  (dl (:array :precision *))
  (d (:array :precision *))
  (du (:array :precision *))
  (dlf (:array :precision *))
  (df (:array :precision *))
  (duf (:array :precision *))
  (du2 (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; porfs
(deflapack porfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (af (:array :precision * *))
  (ldaf blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; pprfs
(deflapack pprfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (afp (:array :precision *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (iwork (:array blas-int *))
  (info blas-int :out))

;;; pbrfs
(deflapack pbrfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (afb (:array :precision * *))
  (ldafb blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; ptrfs
(deflapack ptrfs (:single :double) :void
  (n blas-int)
  (nrhs blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (:array :precision *))
  (df (case :precision
	(:complex-single '(:array :single *))
	(:complex-double '(:array :double *))
	(t '(:array :precision *))))
  (ef (:array :precision *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (info blas-int :out))

(deflapack ptrfs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (:array :precision *))
  (df (case :precision
	(:complex-single '(:array :single *))
	(:complex-double '(:array :double *))
	(t '(:array :precision *))))
  (ef (:array :precision *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array blas-int *))))
  (info blas-int :out))

;;; syrfs
(deflapack syrfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (af (:array :precision * *))
  (ldaf blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; herfs
(deflapack herfs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (af (:array :precision * *))
  (ldaf blas-int)
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array blas-int *))))
  (info blas-int :out))

;;; sprfs
(deflapack sprfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (afp (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; hprfs
(deflapack hprfs (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (afp (:array :precision *))
  (ipiv (:array blas-int *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *) :in-out)
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array blas-int *))))
  (info blas-int :out))

;;; trrfs
(deflapack trrfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (nrhs blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *))
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; tprfs
(deflapack tprfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (nrhs blas-int)
  (ap (:array :precision *))
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *))
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))

;;; tbrfs
(deflapack tbrfs (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (trans :string)
  (diag :string)
  (n blas-int)
  (kd blas-int)
  (nrhs blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (b (:array :precision * *))
  (ldb blas-int)
  (x (:array :precision * *))
  (ldx blas-int)
  (ferr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (berr (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (work (:array :precision *))
  (i/rwork (case :precision
	     (:complex-single '(:array :single *))
	     (:complex-double '(:array :double *))
	     (t '(:array blas-int *))))
  (info blas-int :out))


;;;; routine for matrix inversion

;;; getri
(deflapack getri (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *))
  (work (:array :precision *))
  (lwork blas-int)
  (info blas-int :out))

;;; potri
(deflapack potri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (info blas-int :out))

;;; pptri
(deflapack pptri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (info blas-int :out))

;;; sytri
(deflapack sytri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *))
  (work (:array :precision *))
  (info blas-int :out))

;;; hetri
(deflapack hetri (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (ipiv (:array blas-int *))
  (work (:array :precision *))
  (info blas-int :out))

;;; sptri
(deflapack sptri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (ipiv (:array blas-int *))
  (work (:array :precision *))
  (info blas-int :out))

;;; hptri
(deflapack hptri (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (ipiv (:array blas-int *))
  (work (:array :precision *))
  (info blas-int :out))

;;; trtri
(deflapack trtri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (diag :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (info blas-int :out))

;;; tptri
(deflapack tptri (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (diag :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (info blas-int :out))


;;;; routines for matrix equilibration

;;; geequ
(deflapack geequ (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (r (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (c (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (rowcnd (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision))
	  :out)
  (colcnd (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision))
	  :out)
  (amax (case :precision
	  (:complex-single :single)
	  (:complex-double :double)
	  (t :precision))
	:out)
  (info blas-int :out))

;;; gbequ
(deflapack gbequ (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (kl blas-int)
  (ku blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (r (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (c (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (rowcnd (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision))
	  :out)
  (colcnd (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision))
	  :out)
  (amax (case :precision
	  (:complex-single :single)
	  (:complex-double :double)
	  (t :precision))
	:out)
  (info blas-int :out))

;;; poequ
(deflapack poequ (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (s (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (scond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (amax (case :precision
	  (:complex-single :single)
	  (:complex-double :double)
	  (t :precision))
	:out)
  (info blas-int :out)) 

;;; ppequ
(deflapack ppequ (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (s (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (scond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (amax (case :precision
	  (:complex-single :single)
	  (:complex-double :double)
	  (t :precision))
	:out)
  (info blas-int :out))

;;; pbequ
(deflapack pbequ (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *))
  (ldab blas-int)
  (s (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (scond (case :precision
	   (:complex-single :single)
	   (:complex-double :double)
	   (t :precision))
	 :out)
  (amax (case :precision
	  (:complex-single :single)
	  (:complex-double :double)
	  (t :precision))
	:out)
  (info blas-int :out))



;;;;; TODO: Driver routines
 


;;;;;; LAPACK routines: Least square and eigenvalue problems

;;;;; Computational routines

;;;; routines for orthogonal factorizations

;;; geqrf
(deflapack geqrf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; geqpf
(deflapack geqpf (:single :double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (jpvt (:array blas-int *) :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *))
  (info blas-int :out))

(deflapack geqpf (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (jpvt (:array blas-int *) :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array :precision *))))
  (info blas-int :out))

;;; geqp3
(deflapack geqp3 (:single :double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (jpvt (:array blas-int *) :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *))
  (lwork blas-int)
  (info blas-int :out))

(deflapack geqp3 (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (jpvt (:array blas-int *) :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array :precision *))))
  (lwork blas-int)
  (info blas-int :out))

;;; orgqr
(deflapack orgqr (:single :double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormqr
(deflapack ormqr (:single :double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ungqr
(deflapack ungqr (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmqr
(deflapack unmqr (:complex-single :complex-double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; gelqf
(deflapack gelqf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; orglq
(deflapack orglq (:single :double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormlq
(deflapack ormlq (:single :double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unglq
(deflapack unglq (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmlq
(deflapack unmlq (:complex-single :complex-double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; geqlf
(deflapack geqlf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; orgql
(deflapack orgql (:single :double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ungql
(deflapack ungql (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormql
(deflapack ormql (:single :double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmql
(deflapack unmql (:complex-single :complex-double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; gerqf
(deflapack gerqf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; orgrq
(deflapack orgrq (:single :double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ungrq
(deflapack ungrq (:complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormrq
(deflapack ormrq (:single :double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmrq
(deflapack unmrq (:complex-single :complex-double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; tzrzf
(deflapack tzrzf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormrz
(deflapack ormrz (:single :double) :void
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (l blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ggqrf
(deflapack ggqrf (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (m blas-int)
  (p blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (taua (:array :precision *) :in-out)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (taub (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ggrqf
(deflapack ggrqf (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (p blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (taua (:array :precision *) :in-out)
  (b (:array :precision * *) :in-out)
  (ldb blas-int)
  (taub (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))


;;;; routines for singular value decomposition

;;; gebrd
(deflapack gebrd (:single :double :complex-single :complex-double) :void
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tauq (:array :precision *) :in-out)
  (taup (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))) 

;;; gbbrd
(deflapack gbbrd (:single :double) :void
  (vect :string)
  (m blas-int)
  (n blas-int)
  (ncc blas-int)
  (kl blas-int)
  (ku blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (pt (:array :precision * *) :in-out)
  (ldpt blas-int)
  (c (:array :precision * *))
  (ldc blas-int)
  (work (:array :precision *)) 
  (info blas-int :out))

(deflapack gbbrd (:complex-single :complex-double) :void
  (vect :string)
  (m blas-int)
  (n blas-int)
  (ncc blas-int)
  (kl blas-int)
  (ku blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (pt (:array :precision * *) :in-out)
  (ldpt blas-int)
  (c (:array :precision * *))
  (ldc blas-int)
  (work (:array :precision *))
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array :precision *))))
  (info blas-int :out))

;;; orgbr
(deflapack orgbr (:single :double) :void
  (vect :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormbr
(deflapack ormbr (:single :double) :void
  (vect :string)
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ungbr
(deflapack ungbr (:complex-single :complex-double) :void
  (vect :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmbr
(deflapack unmbr (:complex-single :complex-double) :void
  (vect :string)
  (side :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (k blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; bdsqr
(deflapack bdsqr (:single :double :complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ncvt blas-int)
  (nru blas-int)
  (ncc blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (vt (:array :precision * *) :in-out)
  (ldvt blas-int)
  (u (:array :precision * *) :in-out)
  (ldu blas-int)
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (lwork blas-int)
  (info blas-int :out))

;;; bdsdc
(deflapack bdsdc (:single :double) :void
  (uplo :string)
  (compq :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (u (:array :precision * *) :in-out)
  (ldu blas-int)
  (vt (:array :precision * *) :in-out)
  (ldvt blas-int)
  (q (:array :precision * *) :in-out)
  (iq (:array blas-int *) :in-out)
  (work (:array :precision *))
  (iwork (:array blas-int *))
  (info blas-int :out))


;;;; routines for symmetric eigenvalue problems

;;; sytrd
(deflapack sytrd (:single :double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; syrdb
(deflapack syrdb (:single :double) :void
  (jobz :string)
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tau (:array :precision *) :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; herdb
(deflapack herdb (:complex-single :complex-double) :void
  (jobz :string)
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (d (:array :precision *) :in-out)
  (e (:array :precision *) :in-out)
  (tau (:array :precision *) :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; orgtr
(deflapack orgtr (:single :double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ormtr
(deflapack ormtr (:single :double) :void
  (side :string)
  (uplo :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out)))

;;; hetrd
(deflapack hetrd (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tau (:array :precision *) :in-out)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; ungtr
(deflapack ungtr (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (a (:array :precision * *) :in-out)
  (lda blas-int)
  (tau (:array :precision *))
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; unmtr
(deflapack unmtr (:complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (a (:array :precision * *))
  (lda blas-int)
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *) :in-out)
  (lwork blas-int)
  (info blas-int :out))

;;; sptrd
(deflapack sptrd (:single :double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tau (:array :precision *) :in-out)
  (info blas-int :out))

;;; opgtr
(deflapack opgtr (:single :double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (tau (:array :precision *))
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; opmtr
(deflapack opmtr (:single :double) :void
  (side :string)
  (uplo :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (ap (:array :precision *))
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; hptrd
(deflapack hptrd (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *) :in-out)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (tau (:array :precision *) :in-out)
  (info blas-int :out))

;;; upgtr
(deflapack upgtr (:complex-single :complex-double) :void
  (uplo :string)
  (n blas-int)
  (ap (:array :precision *))
  (tau (:array :precision *))
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; upmtr
(deflapack upmtr (:complex-single :complex-double) :void
  (side :string)
  (uplo :string)
  (trans :string)
  (m blas-int)
  (n blas-int)
  (ap (:array :precision *))
  (tau (:array :precision *))
  (c (:array :precision * *) :in-out)
  (ldc blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; sbtrd
(deflapack sbtrd (:single :double) :void
  (vect :string)
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; hbtrd
(deflapack hbtrd (:complex-single :complex-double) :void
  (vect :string)
  (uplo :string)
  (n blas-int)
  (kd blas-int)
  (ab (:array :precision * *) :in-out)
  (ldab blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (q (:array :precision * *) :in-out)
  (ldq blas-int)
  (work (:array :precision *))
  (info blas-int :out))

;;; sterf
(deflapack sterf (:single :double) :void
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (info blas-int :out))

;;; steqr
(deflapack steqr (:single :double :complex-single :complex-double) :void
  (compz :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (info blas-int :out))

;;; stemr
;;; TODO: test tryrac, it's a boolean parameter
(deflapack stemr (:single :double :complex-single :complex-double) :void
  (jobz :string)
  (range :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (vl (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (vu (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (il blas-int)
  (iu blas-int)
  (m blas-int :out)
  (w (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (nzc blas-int)
  (isuppz (:array blas-int *) :in-out)
  (tryrac :boolean :in-out)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (lwork blas-int)
  (iwork (:array blas-int *) :in-out)
  (liwork blas-int)
  (info blas-int :out))

;;; stedc
(deflapack stedc (:single :double) :void
  (compz :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (:array :precision * *) :in-out)
  (lwork blas-int)
  (iwork (:array blas-int *) :in-out)
  (liwork blas-int)
  (info blas-int :out))

(deflapack stedc (:complex-single :complex-double) :void
  (compz :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (:array :precision * *) :in-out)
  (lwork blas-int)
  (rwork (case :precision
	   (:complex-single '(:array :single *))
	   (:complex-double '(:array :double *))
	   (t '(:array :precision *)))
	 :in-out)
  (lrwork blas-int)
  (iwork (:array blas-int *) :in-out)
  (liwork blas-int)
  (info blas-int :out))

;;; stegr
(deflapack stegr (:single :double :complex-single :complex-double) :void
  (jobz :string)
  (range :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (vl (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (vu (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (il blas-int)
  (iu blas-int)
  (abstol (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision)))
  (m blas-int :out)
  (w (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (isuppz (:array blas-int *) :in-out)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *)))
	:in-out)
  (lwork blas-int)
  (iwork (:array blas-int *) :in-out)
  (liwork blas-int)
  (info blas-int :out))

;;; pteqr
(deflapack pteqr (:single :double :complex-single :complex-double) :void
  (compz :string)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (info blas-int :out))

;;; stebz
(deflapack stebz (:single :double) :void
  (range :string)
  (order :string)
  (n blas-int)
  (vl (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (vu (case :precision
	(:complex-single :single)
	(:complex-double :double)
	(t :precision)))
  (il blas-int)
  (iu blas-int)
  (abstol (case :precision
	    (:complex-single :single)
	    (:complex-double :double)
	    (t :precision)))
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (m blas-int :out)
  (nsplit blas-int :out)
  (w (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *)))
     :in-out)
  (iblock (:array blas-int *) :in-out)
  (isplit (:array blas-int *) :in-out)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (iwork (:array blas-int *))
  (info blas-int :out))

;;; stein
(deflapack stein (:single :double :complex-single :complex-double) :void
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (e (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (m blas-int)
  (w (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (iblock (:array blas-int *))
  (isplit (:array blas-int *))
  (z (:array :precision * *) :in-out)
  (ldz blas-int)
  (work (case :precision
	  (:complex-single '(:array :single *))
	  (:complex-double '(:array :double *))
	  (t '(:array :precision *))))
  (iwork (:array blas-int *))
  (ifailv (:array blas-int *) :in-out)
  (info blas-int :out)))

;;; disna
(deflapack disna (:single :double) :void
  (jobz :string)
  (m blas-int)
  (n blas-int)
  (d (case :precision
       (:complex-single '(:array :single *))
       (:complex-double '(:array :double *))
       (t '(:array :precision *))))
  (sep (case :precision
	 (:complex-single '(:array :single *))
	 (:complex-double '(:array :double *))
	 (t '(:array :precision *)))
       :in-out)
  (info blas-int :out))

