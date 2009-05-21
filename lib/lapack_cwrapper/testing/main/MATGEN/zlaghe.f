      SUBROUTINE ZLAGHE( N, K, D, A, LDA, ISEED, WORK, INFO )
*
*  -- LAPACK auxiliary test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      INTEGER            INFO, K, LDA, N
*     ..
*     .. Array Arguments ..
      INTEGER            ISEED( 4 )
      DOUBLE PRECISION   D( * )
      COMPLEX*16         A( LDA, * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  ZLAGHE generates a complex hermitian matrix A, by pre- and post-
*  multiplying a real diagonal matrix D with a random unitary matrix:
*  A = U*D*U'. The semi-bandwidth may then be reduced to k by additional
*  unitary transformations.
*
*  Arguments
*  =========
*
*  N       (input) INTEGER
*          The order of the matrix A.  N >= 0.
*
*  K       (input) INTEGER
*          The number of nonzero subdiagonals within the band of A.
*          0 <= K <= N-1.
*
*  D       (input) DOUBLE PRECISION array, dimension (N)
*          The diagonal elements of the diagonal matrix D.
*
*  A       (output) COMPLEX*16 array, dimension (LDA,N)
*          The generated n by n hermitian matrix A (the full matrix is
*          stored).
*
*  LDA     (input) INTEGER
*          The leading dimension of the array A.  LDA >= N.
*
*  ISEED   (input/output) INTEGER array, dimension (4)
*          On entry, the seed of the random number generator; the array
*          elements must be between 0 and 4095, and ISEED(4) must be
*          odd.
*          On exit, the seed is updated.
*
*  WORK    (workspace) COMPLEX*16 array, dimension (2*N)
*
*  INFO    (output) INTEGER
*          = 0: successful exit
*          < 0: if INFO = -i, the i-th argument had an illegal value
*
*  =====================================================================
*
*     .. Parameters ..
      COMPLEX*16         ZERO, ONE, HALF
      PARAMETER          ( ZERO = ( 0.0D+0, 0.0D+0 ),
     $                   ONE = ( 1.0D+0, 0.0D+0 ),
     $                   HALF = ( 0.5D+0, 0.0D+0 ) )
*     ..
*     .. Local Scalars ..
      INTEGER            I, J
      DOUBLE PRECISION   WN
      COMPLEX*16         ALPHA, TAU, WA, WB
*     ..
*     .. External Subroutines ..
      EXTERNAL           cxerbla, ZAXPY, ZGEMV, ZGERC, ZHEMV, ZHER2,
     $                   czlarnv, ZSCAL
*     ..
*     .. External Functions ..
      DOUBLE PRECISION   DZNRM2
      COMPLEX*16         ZDOTC
      EXTERNAL           DZNRM2, ZDOTC
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, DBLE, DCONJG, MAX
*     ..
*     .. Executable Statements ..
*
*     Test the input arguments
*
      INFO = 0
      IF( N.LT.0 ) THEN
         INFO = -1
      ELSE IF( K.LT.0 .OR. K.GT.N-1 ) THEN
         INFO = -2
      ELSE IF( LDA.LT.MAX( 1, N ) ) THEN
         INFO = -5
      END IF
      IF( INFO.LT.0 ) THEN
         CALL cxerbla( 'ZLAGHE', -INFO )
         RETURN
      END IF
*
*     initialize lower triangle of A to diagonal matrix
*
      DO 20 J = 1, N
         DO 10 I = J + 1, N
            A( I, J ) = ZERO
   10    CONTINUE
   20 CONTINUE
      DO 30 I = 1, N
         A( I, I ) = D( I )
   30 CONTINUE
*
*     Generate lower triangle of hermitian matrix
*
      DO 40 I = N - 1, 1, -1
*
*        generate random reflection
*
         CALL czlarnv( 3, ISEED, N-I+1, WORK )
         WN = DZNRM2( N-I+1, WORK, 1 )
         WA = ( WN / ABS( WORK( 1 ) ) )*WORK( 1 )
         IF( WN.EQ.ZERO ) THEN
            TAU = ZERO
         ELSE
            WB = WORK( 1 ) + WA
            CALL ZSCAL( N-I, ONE / WB, WORK( 2 ), 1 )
            WORK( 1 ) = ONE
            TAU = DBLE( WB / WA )
         END IF
*
*        apply random reflection to A(i:n,i:n) from the left
*        and the right
*
*        compute  y := tau * A * u
*
         CALL ZHEMV( 'Lower', N-I+1, TAU, A( I, I ), LDA, WORK, 1, ZERO,
     $               WORK( N+1 ), 1 )
*
*        compute  v := y - 1/2 * tau * ( y, u ) * u
*
         ALPHA = -HALF*TAU*ZDOTC( N-I+1, WORK( N+1 ), 1, WORK, 1 )
         CALL ZAXPY( N-I+1, ALPHA, WORK, 1, WORK( N+1 ), 1 )
*
*        apply the transformation as a rank-2 update to A(i:n,i:n)
*
         CALL ZHER2( 'Lower', N-I+1, -ONE, WORK, 1, WORK( N+1 ), 1,
     $               A( I, I ), LDA )
   40 CONTINUE
*
*     Reduce number of subdiagonals to K
*
      DO 60 I = 1, N - 1 - K
*
*        generate reflection to annihilate A(k+i+1:n,i)
*
         WN = DZNRM2( N-K-I+1, A( K+I, I ), 1 )
         WA = ( WN / ABS( A( K+I, I ) ) )*A( K+I, I )
         IF( WN.EQ.ZERO ) THEN
            TAU = ZERO
         ELSE
            WB = A( K+I, I ) + WA
            CALL ZSCAL( N-K-I, ONE / WB, A( K+I+1, I ), 1 )
            A( K+I, I ) = ONE
            TAU = DBLE( WB / WA )
         END IF
*
*        apply reflection to A(k+i:n,i+1:k+i-1) from the left
*
         CALL ZGEMV( 'Conjugate transpose', N-K-I+1, K-1, ONE,
     $               A( K+I, I+1 ), LDA, A( K+I, I ), 1, ZERO, WORK, 1 )
         CALL ZGERC( N-K-I+1, K-1, -TAU, A( K+I, I ), 1, WORK, 1,
     $               A( K+I, I+1 ), LDA )
*
*        apply reflection to A(k+i:n,k+i:n) from the left and the right
*
*        compute  y := tau * A * u
*
         CALL ZHEMV( 'Lower', N-K-I+1, TAU, A( K+I, K+I ), LDA,
     $               A( K+I, I ), 1, ZERO, WORK, 1 )
*
*        compute  v := y - 1/2 * tau * ( y, u ) * u
*
         ALPHA = -HALF*TAU*ZDOTC( N-K-I+1, WORK, 1, A( K+I, I ), 1 )
         CALL ZAXPY( N-K-I+1, ALPHA, A( K+I, I ), 1, WORK, 1 )
*
*        apply hermitian rank-2 update to A(k+i:n,k+i:n)
*
         CALL ZHER2( 'Lower', N-K-I+1, -ONE, A( K+I, I ), 1, WORK, 1,
     $               A( K+I, K+I ), LDA )
*
         A( K+I, I ) = -WA
         DO 50 J = K + I + 1, N
            A( J, I ) = ZERO
   50    CONTINUE
   60 CONTINUE
*
*     Store full hermitian matrix
*
      DO 80 J = 1, N
         DO 70 I = J + 1, N
            A( J, I ) = DCONJG( A( I, J ) )
   70    CONTINUE
   80 CONTINUE
      RETURN
*
*     End of ZLAGHE
*
      END
