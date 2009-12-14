      SUBROUTINE ZERRLS( PATH, NUNIT )
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
*  ZERRLS tests the error exits for the COMPLEX*16 least squares
*  driver routines (czgels, ccgelsS, ccgelsX, ccgelsY, ccgelsD).
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
      DOUBLE PRECISION   RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      DOUBLE PRECISION   RW( NMAX ), S( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), B( NMAX, NMAX ), W( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, CHKXER, czgels, czgelsD, czgelsS, czgelsX,
     $                   czgelsY
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
      A( 1, 1 ) = ( 1.0D+0, 0.0D+0 )
      A( 1, 2 ) = ( 2.0D+0, 0.0D+0 )
      A( 2, 2 ) = ( 3.0D+0, 0.0D+0 )
      A( 2, 1 ) = ( 4.0D+0, 0.0D+0 )
      OK = .TRUE.
      WRITE( NOUT, FMT = * )
*
*     Test error exits for the least squares driver routines.
*
      IF( LSAMEN( 2, C2, 'LS' ) ) THEN
*
*        czgels
*
         SRNAMT = 'czgels '
         INFOT = 1
         CALL czgels( '/', 0, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgels( 'N', -1, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgels( 'N', 0, -1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgels( 'N', 0, 0, -1, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgels( 'N', 2, 0, 0, A, 1, B, 2, W, 2, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgels( 'N', 2, 0, 0, A, 2, B, 1, W, 2, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgels( 'N', 1, 1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'czgels ', INFOT, NOUT, LERR, OK )
*
*        czgelsS
*
         SRNAMT = 'czgelsS'
         INFOT = 1
         CALL czgelsS( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgelsS( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgelsS( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgelsS( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 2, RW,
     $                INFO )
         CALL CHKXER( 'czgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgelsS( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 2, RW,
     $                INFO )
         CALL CHKXER( 'czgelsS', INFOT, NOUT, LERR, OK )
*
*        czgelsX
*
         SRNAMT = 'czgelsX'
         INFOT = 1
         CALL czgelsX( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'czgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgelsX( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'czgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgelsX( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'czgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgelsX( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'czgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgelsX( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, RW,
     $                INFO )
         CALL CHKXER( 'czgelsX', INFOT, NOUT, LERR, OK )
*
*        czgelsY
*
         SRNAMT = 'czgelsY'
         INFOT = 1
         CALL czgelsY( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgelsY( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgelsY( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgelsY( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgelsY( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, 10, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgelsY( 0, 3, 0, A, 1, B, 3, IP, RCOND, IRNK, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgelsY', INFOT, NOUT, LERR, OK )
*
*        czgelsD
*
         SRNAMT = 'czgelsD'
         INFOT = 1
         CALL czgelsD( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10, RW,
     $                IP, INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgelsD( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10, RW,
     $                IP, INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgelsD( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 10, RW,
     $                IP, INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgelsD( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 10, RW,
     $                IP, INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgelsD( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 10, RW,
     $                IP, INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czgelsD( 2, 2, 1, A, 2, B, 2, S, RCOND, IRNK, W, 1, RW, IP,
     $                INFO )
         CALL CHKXER( 'czgelsD', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRLS
*
      END
