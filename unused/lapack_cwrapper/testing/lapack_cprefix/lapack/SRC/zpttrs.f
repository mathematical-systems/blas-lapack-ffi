      SUBROUTINE ZPTTRS( UPLO, N, NRHS, D, E, B, LDB, INFO )
*
*  -- LAPACK routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      CHARACTER          UPLO
      INTEGER            INFO, LDB, N, NRHS
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   D( * )
      COMPLEX*16         B( LDB, * ), E( * )
*     ..
*
*  Purpose
*  =======
*
*  CZPTTRS solves a tridiagonal system of the form
*     A * X = B
*  using the factorization A = U'*D*U or A = L*D*L' computed by CZPTTRF.
*  D is a diagonal matrix specified in the vector D, U (or L) is a unit
*  bidiagonal matrix whose superdiagonal (subdiagonal) is specified in
*  the vector E, and X and B are N by NRHS matrices.
*
*  Arguments
*  =========
*
*  UPLO    (input) CHARACTER*1
*          Specifies the form of the factorization and whether the
*          vector E is the superdiagonal of the upper bidiagonal factor
*          U or the subdiagonal of the lower bidiagonal factor L.
*          = 'U':  A = U'*D*U, E is the superdiagonal of U
*          = 'L':  A = L*D*L', E is the subdiagonal of L
*
*  N       (input) INTEGER
*          The order of the tridiagonal matrix A.  N >= 0.
*
*  NRHS    (input) INTEGER
*          The number of right hand sides, i.e., the number of columns
*          of the matrix B.  NRHS >= 0.
*
*  D       (input) DOUBLE PRECISION array, dimension (N)
*          The n diagonal elements of the diagonal matrix D from the
*          factorization A = U'*D*U or A = L*D*L'.
*
*  E       (input) COMPLEX*16 array, dimension (N-1)
*          If UPLO = 'U', the (n-1) superdiagonal elements of the unit
*          bidiagonal factor U from the factorization A = U'*D*U.
*          If UPLO = 'L', the (n-1) subdiagonal elements of the unit
*          bidiagonal factor L from the factorization A = L*D*L'.
*
*  B       (input/output) DOUBLE PRECISION array, dimension (LDB,NRHS)
*          On entry, the right hand side vectors B for the system of
*          linear equations.
*          On exit, the solution vectors, X.
*
*  LDB     (input) INTEGER
*          The leading dimension of the array B.  LDB >= max(1,N).
*
*  INFO    (output) INTEGER
*          = 0: successful exit
*          < 0: if INFO = -k, the k-th argument had an illegal value
*
*  =====================================================================
*
*     .. Local Scalars ..
      LOGICAL            UPPER
      INTEGER            IUPLO, J, JB, NB
*     ..
*     .. External Functions ..
      INTEGER            ILAENV
      EXTERNAL           ILAENV
*     ..
*     .. External Subroutines ..
      EXTERNAL           XERBLA, CZPTTS2
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          MAX, MIN
*     ..
*     .. Executable Statements ..
*
*     Test the input arguments.
*
      INFO = 0
      UPPER = ( UPLO.EQ.'U' .OR. UPLO.EQ.'u' )
      IF( .NOT.UPPER .AND. .NOT.( UPLO.EQ.'L' .OR. UPLO.EQ.'l' ) ) THEN
         INFO = -1
      ELSE IF( N.LT.0 ) THEN
         INFO = -2
      ELSE IF( NRHS.LT.0 ) THEN
         INFO = -3
      ELSE IF( LDB.LT.MAX( 1, N ) ) THEN
         INFO = -7
      END IF
      IF( INFO.NE.0 ) THEN
         CALL XERBLA( 'CZPTTRS', -INFO )
         RETURN
      END IF
*
*     Quick return if possible
*
      IF( N.EQ.0 .OR. NRHS.EQ.0 )
     $   RETURN
*
*     Determine the number of right-hand sides to solve at a time.
*
      IF( NRHS.EQ.1 ) THEN
         NB = 1
      ELSE
         NB = MAX( 1, ILAENV( 1, 'CZPTTRS', UPLO, N, NRHS, -1, -1 ) )
      END IF
*
*     Decode UPLO
*
      IF( UPPER ) THEN
         IUPLO = 1
      ELSE
         IUPLO = 0
      END IF
*
      IF( NB.GE.NRHS ) THEN
         CALL CZPTTS2( IUPLO, N, NRHS, D, E, B, LDB )
      ELSE
         DO 10 J = 1, NRHS, NB
            JB = MIN( NRHS-J+1, NB )
            CALL CZPTTS2( IUPLO, N, JB, D, E, B( 1, J ), LDB )
   10    CONTINUE
      END IF
*
      RETURN
*
*     End of CZPTTRS
*
      END