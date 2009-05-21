      SUBROUTINE CERRQR( PATH, NUNIT )
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
*  CERRQR tests the error exits for the COMPLEX routines
*  that use the QR decomposition of a general matrix.
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
      EXTERNAL        ALAESM, ccgeqr2, ccgeqrf, CGEQRS, CHKXER, ccung2r,
     $                   ccungqr, ccunm2r, ccunmqr
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
*     Error exits for QR factorization
*
*     ccgeqrf
*
      SRNAMT = 'ccgeqrf'
      INFOT = 1
      CALL ccgeqrf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgeqrf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgeqrf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccgeqrf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqrf', INFOT, NOUT, LERR, OK )
*
*     ccgeqr2
*
      SRNAMT = 'ccgeqr2'
      INFOT = 1
      CALL ccgeqr2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgeqr2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgeqr2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeqr2', INFOT, NOUT, LERR, OK )
*
*     CGEQRS
*
      SRNAMT = 'CGEQRS'
      INFOT = 1
      CALL CGEQRS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGEQRS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGEQRS( 1, 2, 0, A, 2, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL CGEQRS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL CGEQRS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL CGEQRS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL CGEQRS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQRS', INFOT, NOUT, LERR, OK )
*
*     ccungqr
*
      SRNAMT = 'ccungqr'
      INFOT = 1
      CALL ccungqr( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungqr( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungqr( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungqr( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungqr( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccungqr( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ccungqr( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'ccungqr', INFOT, NOUT, LERR, OK )
*
*     ccung2r
*
      SRNAMT = 'ccung2r'
      INFOT = 1
      CALL ccung2r( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccung2r( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccung2r( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccung2r( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccung2r( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccung2r( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2r', INFOT, NOUT, LERR, OK )
*
*     ccunmqr
*
      SRNAMT = 'ccunmqr'
      INFOT = 1
      CALL ccunmqr( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunmqr( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunmqr( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunmqr( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmqr( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmqr( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmqr( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmqr( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmqr( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunmqr( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmqr( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmqr( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmqr', INFOT, NOUT, LERR, OK )
*
*     ccunm2r
*
      SRNAMT = 'ccunm2r'
      INFOT = 1
      CALL ccunm2r( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunm2r( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunm2r( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunm2r( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2r( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2r( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2r( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunm2r( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunm2r( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunm2r( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2r', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRQR
*
      END
