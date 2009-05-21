      SUBROUTINE SERRLQ( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  SERRLQ tests the error exits for the REAL routines
*  that use the LQ decomposition of a general matrix.
*
*  Arguments
*  =========
*
*  PATH    (input) CHARACTER*3
*          The LAPACK path name for the routines to be tested.
*
*  NUNIT   (input) INTEGER
*          The unit number for output.
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            NMAX
      PARAMETER          ( NMAX = 2 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, INFO, J
*     ..
*     .. Local Arrays ..
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgelq2, csgelqf, SGELQS, 
     $  csorgl2, 
     $                   csorglq, csorml2, csormlq
*     ..
*     .. Scalars in Common ..
      LOGICAL            LERR, OK
      CHARACTER*7        SRNAMT
      INTEGER            INFOT, NOUT
*     ..
*     .. Common blocks ..
      COMMON             / INFOC / INFOT, NOUT, OK, LERR
      COMMON             / SRNAMC / SRNAMT
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          REAL
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = 1. / REAL( I+J )
            AF( I, J ) = 1. / REAL( I+J )
   10    CONTINUE
         B( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for LQ factorization
*
*     csgelqf
*
      SRNAMT = 'csgelqf'
      INFOT = 1
      CALL csgelqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgelqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgelqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'csgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csgelqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'csgelqf', INFOT, NOUT, LERR, OK )
*
*     csgelq2
*
      SRNAMT = 'csgelq2'
      INFOT = 1
      CALL csgelq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'csgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgelq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgelq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgelq2', INFOT, NOUT, LERR, OK )
*
*     SGELQS
*
      SRNAMT = 'SGELQS'
      INFOT = 1
      CALL SGELQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGELQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGELQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL SGELQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL SGELQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL SGELQS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL SGELQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGELQS', INFOT, NOUT, LERR, OK )
*
*     csorglq
*
      SRNAMT = 'csorglq'
      INFOT = 1
      CALL csorglq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorglq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorglq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorglq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorglq( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorglq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL csorglq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'csorglq', INFOT, NOUT, LERR, OK )
*
*     csorgl2
*
      SRNAMT = 'csorgl2'
      INFOT = 1
      CALL csorgl2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgl2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgl2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgl2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgl2( 1, 1, 2, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorgl2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgl2', INFOT, NOUT, LERR, OK )
*
*     csormlq
*
      SRNAMT = 'csormlq'
      INFOT = 1
      CALL csormlq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csormlq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csormlq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csormlq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormlq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormlq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormlq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormlq( 'L', 'N', 2, 0, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormlq( 'R', 'N', 0, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csormlq( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormlq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormlq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormlq', INFOT, NOUT, LERR, OK )
*
*     csorml2
*
      SRNAMT = 'csorml2'
      INFOT = 1
      CALL csorml2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorml2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorml2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csorml2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorml2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorml2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorml2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorml2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorml2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csorml2( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorml2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRLQ
*
      END
