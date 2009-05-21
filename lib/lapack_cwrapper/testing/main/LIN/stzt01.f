      REAL             FUNCTION STZT01( M, N, A, AF, LDA, TAU, WORK,
     $                 LWORK )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      INTEGER            LDA, LWORK, M, N
*     ..
*     .. Array Arguments ..
      REAL               A( LDA, * ), AF( LDA, * ), TAU( * ),
     $                   WORK( LWORK )
*     ..
*
*  Purpose
*  =======
*
*  STZT01 returns
*       || A - R*Q || / ( M * eps * ||A|| )
*  for an upper trapezoidal A that was factored with cstzrqf.
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
*  A       (input) REAL array, dimension (LDA,N)
*          The original upper trapezoidal M by N matrix A.
*
*  AF      (input) REAL array, dimension (LDA,N)
*          The output of cstzrqf for input matrix A.
*          The lower triangle is not referenced.
*
*  LDA     (input) INTEGER
*          The leading dimension of the arrays A and AF.
*
*  TAU     (input) REAL array, dimension (M)
*          Details of the  Householder transformations as returned by
*          cstzrqf.
*
*  WORK    (workspace) REAL array, dimension (LWORK)
*
*  LWORK   (input) INTEGER
*          The length of the array WORK.  LWORK >= m*n + m.
*
*  =====================================================================
*
*     .. Parameters ..
      REAL               ZERO, ONE
      PARAMETER          ( ZERO = 0.0E0, ONE = 1.0E0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, J
      REAL               NORMA
*     ..
*     .. Local Arrays ..
      REAL               RWORK( 1 )
*     ..
*     .. External Functions ..
      REAL               SLAMCH, SLANGE
      EXTERNAL           SLAMCH, SLANGE
*     ..
*     .. External Subroutines ..
      EXTERNAL           SAXPY, cslatzm, cslaset, xerbla
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          MAX, REAL
*     ..
*     .. Executable Statements ..
*
      STZT01 = ZERO
*
      IF( LWORK.LT.M*N+M ) THEN
         CALL xerbla( 'STZT01', 8 )
         RETURN
      END IF
*
*     Quick return if possible
*
      IF( M.LE.0 .OR. N.LE.0 )
     $   RETURN
*
      NORMA = SLANGE( 'One-norm', M, N, A, LDA, RWORK )
*
*     Copy upper triangle R
*
      CALL cslaset( 'Full', M, N, ZERO, ZERO, WORK, M )
      DO 20 J = 1, M
         DO 10 I = 1, J
            WORK( ( J-1 )*M+I ) = AF( I, J )
   10    CONTINUE
   20 CONTINUE
*
*     R = R * P(1) * ... *P(m)
*
      DO 30 I = 1, M
         CALL cslatzm( 'Right', I, N-M+1, AF( I, M+1 ), LDA, TAU( I ),
     $                WORK( ( I-1 )*M+1 ), WORK( M*M+1 ), M,
     $                WORK( M*N+1 ) )
   30 CONTINUE
*
*     R = R - A
*
      DO 40 I = 1, N
         CALL SAXPY( M, -ONE, A( 1, I ), 1, WORK( ( I-1 )*M+1 ), 1 )
   40 CONTINUE
*
      STZT01 = SLANGE( 'One-norm', M, N, WORK, M, RWORK )
*
      STZT01 = STZT01 / ( SLAMCH( 'Epsilon' )*REAL( MAX( M, N ) ) )
      IF( NORMA.NE.ZERO )
     $   STZT01 = STZT01 / NORMA
*
      RETURN
*
*     End of STZT01
*
      END
