      SUBROUTINE CERRLS( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  CERRLS tests the error exits for the COMPLEX least squares
*  driver routines (ccgels, ccgelsS, ccgelsX, ccgelsY, ccgelsD).
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
      CHARACTER*2        C2
      INTEGER            INFO, IRNK
      REAL               RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      REAL               RW( NMAX ), S( NMAX )
      COMPLEX            A( NMAX, NMAX ), B( NMAX, NMAX ), W( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, ccgels, ccgelsD, ccgelsS, ccgelsX, ccgelsY,
     $                   CHKXER
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
*     .. Executable Statements ..
*
      NOUT = NUNIT
      C2 = PATH( 2: 3 )
      A( 1, 1 ) = ( 1.0E+0, 0.0E+0 )
      A( 1, 2 ) = ( 2.0E+0, 0.0E+0 )
      A( 2, 2 ) = ( 3.0E+0, 0.0E+0 )
      A( 2, 1 ) = ( 4.0E+0, 0.0E+0 )
      OK = .TRUE.
      WRITE( NOUT, FMT = * )
*
*     Test error exits for the least squares driver routines.
*
      IF( LSAMEN( 2, C2, 'LS' ) ) THEN
*
*        ccgels
*
         SRNAMT = 'ccgels '
         INFOT = 1
         CALL ccgels( '/', 0, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgels( 'N', -1, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgels( 'N', 0, -1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgels( 'N', 0, 0, -1, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgels( 'N', 2, 0, 0, A, 1, B, 2, W, 2, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgels( 'N', 2, 0, 0, A, 2, B, 1, W, 2, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgels( 'N', 1, 1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'ccgels ', INFOT, NOUT, LERR, OK )
*
*        ccgelsS
*
         SRNAMT = 'ccgelsS'
         INFOT = 1
         CALL ccgelsS( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgelsS( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgelsS( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgelsS( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 2, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgelsS( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 2, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsS', INFOT, NOUT, LERR, OK )
*
*        ccgelsX
*
         SRNAMT = 'ccgelsX'
         INFOT = 1
         CALL ccgelsX( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgelsX( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgelsX( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgelsX( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgelsX( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsX', INFOT, NOUT, LERR, OK )
*
*        ccgelsY
*
         SRNAMT = 'ccgelsY'
         INFOT = 1
         CALL ccgelsY( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgelsY( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgelsY( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgelsY( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgelsY( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgelsY( 0, 3, 0, A, 1, B, 3, IP, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgelsY', INFOT, NOUT, LERR, OK )
*
*        ccgelsD
*
         SRNAMT = 'ccgelsD'
         INFOT = 1
         CALL ccgelsD( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgelsD( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgelsD( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgelsD( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 10,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgelsD( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 10,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgelsD( 2, 2, 1, A, 2, B, 2, S, RCOND, IRNK, W, 1,
     $                RW, IP, INFO )
         CALL CHKXER( 'ccgelsD', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRLS
*
      END
