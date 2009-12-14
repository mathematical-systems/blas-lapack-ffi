      REAL             FUNCTION CQPT01( M, N, K, A, AF, LDA, TAU, JPVT,
     $                 WORK, LWORK )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      INTEGER            K, LDA, LWORK, M, N
*     ..
*     .. Array Arguments ..
      INTEGER            JPVT( * )
      COMPLEX            A( LDA, * ), AF( LDA, * ), TAU( * ),
     $                   WORK( LWORK )
*     ..
*
*  Purpose
*  =======
*
*  CQPT01 tests the QR-factorization with pivoting of a matrix A.  The
*  array AF contains the (possibly partial) QR-factorization of A, where
*  the upper triangle of AF(1:k,1:k) is a partial triangular factor,
*  the entries below the diagonal in the first k columns are the
*  Householder vectors, and the rest of AF contains a partially updated
*  matrix.
*
*  This function returns ||A*P - Q*R||/(||norm(A)||*eps*M)
*
*  Arguments
*  =========
*
*  M       (input) INTEGER
*          The number of rows of the matrices A and AF.
*
*  N       (input) INTEGER
*          The number of columns of the matrices A and AF.
*
*  K       (input) INTEGER
*          The number of columns of AF that have been reduced
*          to upper triangular form.
*
*  A       (input) COMPLEX array, dimension (LDA, N)
*          The original matrix A.
*
*  AF      (input) COMPLEX array, dimension (LDA,N)
*          The (possibly partial) output of ccgeqpf.  The upper triangle
*          of AF(1:k,1:k) is a partial triangular factor, the entries
*          below the diagonal in the first k columns are the Householder
*          vectors, and the rest of AF contains a partially updated
*          matrix.
*
*  LDA     (input) INTEGER
*          The leading dimension of the arrays A and AF.
*
*  TAU     (input) COMPLEX array, dimension (K)
*          Details of the Householder transformations as returned by
*          ccgeqpf.
*
*  JPVT    (input) INTEGER array, dimension (N)
*          Pivot information as returned by ccgeqpf.
*
*  WORK    (workspace) COMPLEX array, dimension (LWORK)
*
*  LWORK   (input) INTEGER
*          The length of the array WORK.  LWORK >= M*N+N.
*
*  =====================================================================
*
*     .. Parameters ..
      REAL               ZERO, ONE
      PARAMETER          ( ZERO = 0.0E0, ONE = 1.0E0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, INFO, J
      REAL               NORMA
*     ..
*     .. Local Arrays ..
      REAL               RWORK( 1 )
*     ..
*     .. External Functions ..
      REAL               CLANGE, SLAMCH
      EXTERNAL           CLANGE, SLAMCH
*     ..
*     .. External Subroutines ..
      EXTERNAL           CAXPY, CCOPY, ccunmqr, xerbla
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          CMPLX, MAX, MIN, REAL
*     ..
*     .. Executable Statements ..
*
      CQPT01 = ZERO
*
*     Test if there is enough workspace
*
      IF( LWORK.LT.M*N+N ) THEN
         CALL xerbla( 'CQPT01', 10 )
         RETURN
      END IF
*
*     Quick return if possible
*
      IF( M.LE.0 .OR. N.LE.0 )
     $   RETURN
*
      NORMA = CLANGE( 'One-norm', M, N, A, LDA, RWORK )
*
      DO 30 J = 1, K
         DO 10 I = 1, MIN( J, M )
            WORK( ( J-1 )*M+I ) = AF( I, J )
   10    CONTINUE
         DO 20 I = J + 1, M
            WORK( ( J-1 )*M+I ) = ZERO
   20    CONTINUE
   30 CONTINUE
      DO 40 J = K + 1, N
         CALL CCOPY( M, AF( 1, J ), 1, WORK( ( J-1 )*M+1 ), 1 )
   40 CONTINUE
*
      CALL ccunmqr( 'Left', 'No transpose', M, N, K, AF, LDA, TAU, WORK,
     $             M, WORK( M*N+1 ), LWORK-M*N, INFO )
*
      DO 50 J = 1, N
*
*        Compare i-th column of QR and jpvt(i)-th column of A
*
         CALL CAXPY( M, CMPLX( -ONE ), A( 1, JPVT( J ) ), 1,
     $               WORK( ( J-1 )*M+1 ), 1 )
   50 CONTINUE
*
      CQPT01 = CLANGE( 'One-norm', M, N, WORK, M, RWORK ) /
     $         ( REAL( MAX( M, N ) )*SLAMCH( 'Epsilon' ) )
      IF( NORMA.NE.ZERO )
     $   CQPT01 = CQPT01 / NORMA
*
      RETURN
*
*     End of CQPT01
*
      END