      SUBROUTINE CERRVX( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 31, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  CERRVX tests the error exits for the COMPLEX driver routines
*  for solving linear systems of equations.
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
      PARAMETER          ( NMAX = 4 )
*     ..
*     .. Local Scalars ..
      CHARACTER          EQ
      CHARACTER*2        C2
      INTEGER            I, INFO, J
      REAL               RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      REAL               C( NMAX ), R( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   RF( NMAX ), RW( NMAX )
      COMPLEX            A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL        ccgbsv, ccgbsvX, ccgesv, ccgesvX, ccgtsv, ccgtsvX,
     $                cchesv, cchesvX, CHKXER, cchpsv, cchpsvX, ccpbsv,
     $                ccpbsvX, ccposv, ccposvX, ccppsv, ccppsvX, ccptsv,
     $                   ccptsvX, ccspsv, ccspsvX, ccsysv, ccsysvX
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
      C2 = PATH( 2: 3 )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
            AF( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
   10    CONTINUE
         B( J ) = 0.
         R1( J ) = 0.
         R2( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
         C( J ) = 0.
         R( J ) = 0.
         IP( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        ccgesv
*
         SRNAMT = 'ccgesv '
         INFOT = 1
         CALL ccgesv( -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgesv( 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgesv( 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'ccgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgesv( 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'ccgesv ', INFOT, NOUT, LERR, OK )
*
*        ccgesvX
*
         SRNAMT = 'ccgesvX'
         INFOT = 1
         CALL ccgesvX( '/', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgesvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgesvX( 'N', 'N', -1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgesvX( 'N', 'N', 0, -1, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgesvX( 'N', 'N', 2, 1, A, 1, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgesvX( 'N', 'N', 2, 1, A, 2, AF, 1, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
         CALL ccgesvX( 'F', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'R'
         CALL ccgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = 'C'
         CALL ccgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL ccgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 1,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL ccgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgesvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        ccgbsv
*
         SRNAMT = 'ccgbsv '
         INFOT = 1
         CALL ccgbsv( -1, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbsv( 1, -1, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbsv( 1, 0, -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbsv( 0, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbsv( 1, 1, 1, 0, A, 3, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccgbsv( 2, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbsv ', INFOT, NOUT, LERR, OK )
*
*        ccgbsvX
*
         SRNAMT = 'ccgbsvX'
         INFOT = 1
         CALL ccgbsvX( '/', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbsvX( 'N', '/', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbsvX( 'N', 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbsvX( 'N', 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgbsvX( 'N', 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbsvX( 'N', 'N', 0, 0, 0, -1, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgbsvX( 'N', 'N', 1, 1, 1, 0, A, 2, AF, 4, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgbsvX( 'N', 'N', 1, 1, 1, 0, A, 3, AF, 3, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = '/'
         CALL ccgbsvX( 'F', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         EQ = 'R'
         CALL ccgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         EQ = 'C'
         CALL ccgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL ccgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL ccgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 2, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        ccgtsv
*
         SRNAMT = 'ccgtsv '
         INFOT = 1
         CALL ccgtsv( -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'ccgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgtsv( 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'ccgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccgtsv( 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1, INFO )
         CALL CHKXER( 'ccgtsv ', INFOT, NOUT, LERR, OK )
*
*        ccgtsvX
*
         SRNAMT = 'ccgtsvX'
         INFOT = 1
         CALL ccgtsvX( '/', 'N', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgtsvX( 'N', '/', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgtsvX( 'N', 'N', -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgtsvX( 'N', 'N', 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL ccgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL ccgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 2, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        ccposv
*
         SRNAMT = 'ccposv '
         INFOT = 1
         CALL ccposv( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccposv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccposv( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccposv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccposv( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccposv ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccposv( 'U', 2, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'ccposv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccposv( 'U', 2, 0, A, 2, B, 1, INFO )
         CALL CHKXER( 'ccposv ', INFOT, NOUT, LERR, OK )
*
*        ccposvX
*
         SRNAMT = 'ccposvX'
         INFOT = 1
         CALL ccposvX( '/', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccposvX( 'N', '/', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccposvX( 'N', 'U', -1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccposvX( 'N', 'U', 0, -1, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccposvX( 'N', 'U', 2, 0, A, 1, AF, 2, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccposvX( 'N', 'U', 2, 0, A, 2, AF, 1, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         EQ = '/'
         CALL ccposvX( 'F', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = 'Y'
         CALL ccposvX( 'F', 'U', 1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 1, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL ccposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 2, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccposvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        ccppsv
*
         SRNAMT = 'ccppsv '
         INFOT = 1
         CALL ccppsv( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'ccppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccppsv( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'ccppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccppsv( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'ccppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccppsv( 'U', 2, 0, A, B, 1, INFO )
         CALL CHKXER( 'ccppsv ', INFOT, NOUT, LERR, OK )
*
*        ccppsvX
*
         SRNAMT = 'ccppsvX'
         INFOT = 1
         CALL ccppsvX( '/', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccppsvX( 'N', '/', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccppsvX( 'N', 'U', -1, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccppsvX( 'N', 'U', 0, -1, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         EQ = '/'
         CALL ccppsvX( 'F', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         EQ = 'Y'
         CALL ccppsvX( 'F', 'U', 1, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 1, X, 2, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 2, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccppsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        ccpbsv
*
         SRNAMT = 'ccpbsv '
         INFOT = 1
         CALL ccpbsv( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbsv( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbsv( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpbsv( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpbsv( 'U', 1, 1, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccpbsv( 'U', 2, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbsv ', INFOT, NOUT, LERR, OK )
*
*        ccpbsvX
*
         SRNAMT = 'ccpbsvX'
         INFOT = 1
        CALL ccpbsvX( '/', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccpbsvX( 'N', '/', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbsvX( 'N', 'U', -1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpbsvX( 'N', 'U', 1, -1, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpbsvX( 'N', 'U', 0, 0, -1, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccpbsvX( 'N', 'U', 1, 1, 0, A, 1, AF, 2, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL ccpbsvX( 'N', 'U', 1, 1, 0, A, 2, AF, 1, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
        CALL ccpbsvX( 'F', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'Y'
        CALL ccpbsvX( 'F', 'U', 1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL ccpbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL ccpbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 2, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccpbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        ccptsv
*
         SRNAMT = 'ccptsv '
         INFOT = 1
         CALL ccptsv( -1, 0, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'ccptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccptsv( 0, -1, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'ccptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccptsv( 2, 0, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'ccptsv ', INFOT, NOUT, LERR, OK )
*
*        ccptsvX
*
         SRNAMT = 'ccptsvX'
         INFOT = 1
         CALL ccptsvX( '/', 0, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccptsvX( 'N', -1, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccptsvX( 'N', 0, -1, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccptsvX( 'N', 2, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccptsvX( 'N', 2, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 2, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccptsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'HE' ) ) THEN
*
*        cchesv
*
         SRNAMT = 'cchesv '
         INFOT = 1
         CALL cchesv( '/', 0, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cchesv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchesv( 'U', -1, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cchesv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchesv( 'U', 0, -1, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cchesv ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchesv( 'U', 2, 0, A, 1, IP, B, 2, W, 1, INFO )
         CALL CHKXER( 'cchesv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cchesv( 'U', 2, 0, A, 2, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cchesv ', INFOT, NOUT, LERR, OK )
*
*        cchesvX
*
         SRNAMT = 'cchesvX'
         INFOT = 1
         CALL cchesvX( '/', 'U', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchesvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchesvX( 'N', 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchesvX( 'N', 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cchesvX( 'N', 'U', 2, 0, A, 1, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cchesvX( 'N', 'U', 2, 0, A, 2, AF, 1, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 1, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 1,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cchesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 3, RW, INFO )
         CALL CHKXER( 'cchesvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'HP' ) ) THEN
*
*        cchpsv
*
         SRNAMT = 'cchpsv '
         INFOT = 1
         CALL cchpsv( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpsv( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchpsv( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchpsv( 'U', 2, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchpsv ', INFOT, NOUT, LERR, OK )
*
*        cchpsvX
*
         SRNAMT = 'cchpsvX'
         INFOT = 1
         CALL cchpsvX( '/', 'U', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpsvX( 'N', '/', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cchpsvX( 'N', 'U', -1, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cchpsvX( 'N', 'U', 0, -1, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchpsvX( 'N', 'U', 2, 0, A, AF, IP, B, 1, X, 2, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchpsvX( 'N', 'U', 2, 0, A, AF, IP, B, 2, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'cchpsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        ccsysv
*
         SRNAMT = 'ccsysv '
         INFOT = 1
         CALL ccsysv( '/', 0, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsysv( 'U', -1, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsysv( 'U', 0, -1, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccsysv( 'U', 2, 0, A, 2, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccsysv ', INFOT, NOUT, LERR, OK )
*
*        ccsysvX
*
         SRNAMT = 'ccsysvX'
         INFOT = 1
         CALL ccsysvX( '/', 'U', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsysvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsysvX( 'N', 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccsysvX( 'N', 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccsysvX( 'N', 'U', 2, 0, A, 1, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccsysvX( 'N', 'U', 2, 0, A, 2, AF, 1, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 1, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 1,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL ccsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 3, RW, INFO )
         CALL CHKXER( 'ccsysvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        ccspsv
*
         SRNAMT = 'ccspsv '
         INFOT = 1
         CALL ccspsv( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccspsv( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccspsv( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccspsv( 'U', 2, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccspsv ', INFOT, NOUT, LERR, OK )
*
*        ccspsvX
*
         SRNAMT = 'ccspsvX'
         INFOT = 1
         CALL ccspsvX( '/', 'U', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccspsvX( 'N', '/', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccspsvX( 'N', 'U', -1, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL ccspsvX( 'N', 'U', 0, -1, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 1, X, 2, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 2, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'ccspsvX', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      IF( OK ) THEN
         WRITE( NOUT, FMT = 9999 )PATH
      ELSE
         WRITE( NOUT, FMT = 9998 )PATH
      END IF
*
 9999 FORMAT( 1X, A3, ' drivers passed the tests of the error exits' )
 9998 FORMAT( ' *** ', A3, ' drivers failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of CERRVX
*
      END
