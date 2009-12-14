      SUBROUTINE CERRLQ( PATH, NUNIT )
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
*  CERRLQ tests the error exits for the COMPLEX routines
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
      COMPLEX            A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, ccgelq2, ccgelqf, CGELQS, CHKXER, ccungl2,
     $                   ccunglq, ccunml2, ccunmlq
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
      INTRINSIC          CMPLX, REAL
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
            A( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
            AF( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
   10    CONTINUE
         B( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for LQ factorization
*
*     ccgelqf
*
      SRNAMT = 'ccgelqf'
      INFOT = 1
      CALL ccgelqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgelqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgelqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'ccgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccgelqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'ccgelqf', INFOT, NOUT, LERR, OK )
*
*     ccgelq2
*
      SRNAMT = 'ccgelq2'
      INFOT = 1
      CALL ccgelq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgelq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgelq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgelq2', INFOT, NOUT, LERR, OK )
*
*     CGELQS
*
      SRNAMT = 'CGELQS'
      INFOT = 1
      CALL CGELQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGELQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGELQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL CGELQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL CGELQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL CGELQS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL CGELQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGELQS', INFOT, NOUT, LERR, OK )
*
*     ccunglq
*
      SRNAMT = 'ccunglq'
      INFOT = 1
      CALL ccunglq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunglq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunglq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunglq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunglq( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunglq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ccunglq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'ccunglq', INFOT, NOUT, LERR, OK )
*
*     ccungl2
*
      SRNAMT = 'ccungl2'
      INFOT = 1
      CALL ccungl2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungl2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungl2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungl2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungl2( 1, 1, 2, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccungl2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungl2', INFOT, NOUT, LERR, OK )
*
*     ccunmlq
*
      SRNAMT = 'ccunmlq'
      INFOT = 1
      CALL ccunmlq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunmlq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunmlq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunmlq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmlq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmlq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmlq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmlq( 'L', 'N', 2, 0, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmlq( 'R', 'N', 0, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunmlq( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmlq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmlq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmlq', INFOT, NOUT, LERR, OK )
*
*     ccunml2
*
      SRNAMT = 'ccunml2'
      INFOT = 1
      CALL ccunml2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunml2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunml2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunml2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunml2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunml2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunml2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunml2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunml2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunml2( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunml2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRLQ
*
      END
