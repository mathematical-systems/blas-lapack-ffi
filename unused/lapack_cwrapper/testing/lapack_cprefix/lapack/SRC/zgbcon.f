      SUBROUTINE ZGBCON( NORM, N, KL, KU, AB, LDAB, IPIV, ANORM, RCOND,
     $                   WORK, RWORK, INFO )
*
*  -- LAPACK routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     Modified to call CZLACN2 in place of CZLACON, 10 Feb 03, SJH.
*
*     .. Scalar Arguments ..
      CHARACTER          NORM
      INTEGER            INFO, KL, KU, LDAB, N
      DOUBLE PRECISION   ANORM, RCOND
*     ..
*     .. Array Arguments ..
      INTEGER            IPIV( * )
      DOUBLE PRECISION   RWORK( * )
      COMPLEX*16         AB( LDAB, * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  CZGBCON estimates the reciprocal of the condition number of a complex
*  general band matrix A, in either the 1-norm or the infinity-norm,
*  using the LU factorization computed by CZGBTRF.
*
*  An estimate is obtained for norm(inv(A)), and the reciprocal of the
*  condition number is computed as
*     RCOND = 1 / ( norm(A) * norm(inv(A)) ).
*
*  Arguments
*  =========
*
*  NORM    (input) CHARACTER*1
*          Specifies whether the 1-norm condition number or the
*          infinity-norm condition number is required:
*          = '1' or 'O':  1-norm;
*          = 'I':         Infinity-norm.
*
*  N       (input) INTEGER
*          The order of the matrix A.  N >= 0.
*
*  KL      (input) INTEGER
*          The number of subdiagonals within the band of A.  KL >= 0.
*
*  KU      (input) INTEGER
*          The number of superdiagonals within the band of A.  KU >= 0.
*
*  AB      (input) COMPLEX*16 array, dimension (LDAB,N)
*          Details of the LU factorization of the band matrix A, as
*          computed by CZGBTRF.  U is stored as an upper triangular band
*          matrix with KL+KU superdiagonals in rows 1 to KL+KU+1, and
*          the multipliers used during the factorization are stored in
*          rows KL+KU+2 to 2*KL+KU+1.
*
*  LDAB    (input) INTEGER
*          The leading dimension of the array AB.  LDAB >= 2*KL+KU+1.
*
*  IPIV    (input) INTEGER array, dimension (N)
*          The pivot indices; for 1 <= i <= N, row i of the matrix was
*          interchanged with row IPIV(i).
*
*  ANORM   (input) DOUBLE PRECISION
*          If NORM = '1' or 'O', the 1-norm of the original matrix A.
*          If NORM = 'I', the infinity-norm of the original matrix A.
*
*  RCOND   (output) DOUBLE PRECISION
*          The reciprocal of the condition number of the matrix A,
*          computed as RCOND = 1/(norm(A) * norm(inv(A))).
*
*  WORK    (workspace) COMPLEX*16 array, dimension (2*N)
*
*  RWORK   (workspace) DOUBLE PRECISION array, dimension (N)
*
*  INFO    (output) INTEGER
*          = 0:  successful exit
*          < 0: if INFO = -i, the i-th argument had an illegal value
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( ONE = 1.0D+0, ZERO = 0.0D+0 )
*     ..
*     .. Local Scalars ..
      LOGICAL            LNOTI, ONENRM
      CHARACTER          NORMIN
      INTEGER            IX, J, JP, KASE, KASE1, KD, LM
      DOUBLE PRECISION   AINVNM, SCALE, SMLNUM
      COMPLEX*16         T, ZDUM
*     ..
*     .. Local Arrays ..
      INTEGER            ISAVE( 3 )
*     ..
*     .. External Functions ..
      LOGICAL            LSAME
      INTEGER            IZAMAX
      DOUBLE PRECISION   DLAMCH
      COMPLEX*16         ZDOTC
      EXTERNAL           LSAME, IZAMAX, DLAMCH, ZDOTC
*     ..
*     .. External Subroutines ..
      EXTERNAL           XERBLA, ZAXPY, ZCDRSCL, CZLACN2, CZLATBS
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, DBLE, DIMAG, MIN
*     ..
*     .. Statement Functions ..
      DOUBLE PRECISION   CABS1
*     ..
*     .. Statement Function definitions ..
      CABS1( ZDUM ) = ABS( DBLE( ZDUM ) ) + ABS( DIMAG( ZDUM ) )
*     ..
*     .. Executable Statements ..
*
*     Test the input parameters.
*
      INFO = 0
      ONENRM = NORM.EQ.'1' .OR. LSAME( NORM, 'O' )
      IF( .NOT.ONENRM .AND. .NOT.LSAME( NORM, 'I' ) ) THEN
         INFO = -1
      ELSE IF( N.LT.0 ) THEN
         INFO = -2
      ELSE IF( KL.LT.0 ) THEN
         INFO = -3
      ELSE IF( KU.LT.0 ) THEN
         INFO = -4
      ELSE IF( LDAB.LT.2*KL+KU+1 ) THEN
         INFO = -6
      ELSE IF( ANORM.LT.ZERO ) THEN
         INFO = -8
      END IF
      IF( INFO.NE.0 ) THEN
         CALL XERBLA( 'CZGBCON', -INFO )
         RETURN
      END IF
*
*     Quick return if possible
*
      RCOND = ZERO
      IF( N.EQ.0 ) THEN
         RCOND = ONE
         RETURN
      ELSE IF( ANORM.EQ.ZERO ) THEN
         RETURN
      END IF
*
      SMLNUM = DLAMCH( 'Safe minimum' )
*
*     Estimate the norm of inv(A).
*
      AINVNM = ZERO
      NORMIN = 'N'
      IF( ONENRM ) THEN
         KASE1 = 1
      ELSE
         KASE1 = 2
      END IF
      KD = KL + KU + 1
      LNOTI = KL.GT.0
      KASE = 0
   10 CONTINUE
      CALL CZLACN2( N, WORK( N+1 ), WORK, AINVNM, KASE, ISAVE )
      IF( KASE.NE.0 ) THEN
         IF( KASE.EQ.KASE1 ) THEN
*
*           Multiply by inv(L).
*
            IF( LNOTI ) THEN
               DO 20 J = 1, N - 1
                  LM = MIN( KL, N-J )
                  JP = IPIV( J )
                  T = WORK( JP )
                  IF( JP.NE.J ) THEN
                     WORK( JP ) = WORK( J )
                     WORK( J ) = T
                  END IF
                  CALL ZAXPY( LM, -T, AB( KD+1, J ), 1, WORK( J+1 ), 1 
     $  ) 
   20          CONTINUE
            END IF
*
*           Multiply by inv(U).
*
            CALL CZLATBS( 'Upper', 'No transpose', 'Non-unit', NORMIN, 
     $  N, 
     $                   KL+KU, AB, LDAB, WORK, SCALE, RWORK, INFO )
         ELSE
*
*           Multiply by inv(U').
*
            CALL CZLATBS( 'Upper', 'Conjugate transpose', 'Non-unit',
     $                   NORMIN, N, KL+KU, AB, LDAB, WORK, SCALE, 
     $  RWORK, 
     $                   INFO )
*
*           Multiply by inv(L').
*
            IF( LNOTI ) THEN
               DO 30 J = N - 1, 1, -1
                  LM = MIN( KL, N-J )
                  WORK( J ) = WORK( J ) - ZDOTC( LM, AB( KD+1, J ), 1,
     $                        WORK( J+1 ), 1 )
                  JP = IPIV( J )
                  IF( JP.NE.J ) THEN
                     T = WORK( JP )
                     WORK( JP ) = WORK( J )
                     WORK( J ) = T
                  END IF
   30          CONTINUE
            END IF
         END IF
*
*        Divide X by 1/SCALE if doing so will not cause overflow.
*
         NORMIN = 'Y'
         IF( SCALE.NE.ONE ) THEN
            IX = IZAMAX( N, WORK, 1 )
            IF( SCALE.LT.CABS1( WORK( IX ) )*SMLNUM .OR. SCALE.EQ.ZERO 
     $  ) 
     $         GO TO 40
            CALL ZCDRSCL( N, SCALE, WORK, 1 )
         END IF
         GO TO 10
      END IF
*
*     Compute the estimate of the reciprocal condition number.
*
      IF( AINVNM.NE.ZERO )
     $   RCOND = ( ONE / AINVNM ) / ANORM
*
   40 CONTINUE
      RETURN
*
*     End of CZGBCON
*
      END
