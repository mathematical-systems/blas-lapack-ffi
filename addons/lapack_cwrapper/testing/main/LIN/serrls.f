      SUBROUTINE SERRLS( PATH, NUNIT )
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
*  SERRLS tests the error exits for the REAL least squares
*  driver routines (csgels, csgelsS, csgelsX, csgelsY, csgelsD).
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
      REAL               A( NMAX, NMAX ), B( NMAX, NMAX ), S( NMAX ),
     $                   W( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgels, csgelsD, csgelsS, 
     $  csgelsX, 
     $                   csgelsY
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
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
      A( 1, 1 ) = 1.0E+0
      A( 1, 2 ) = 2.0E+0
      A( 2, 2 ) = 3.0E+0
      A( 2, 1 ) = 4.0E+0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'LS' ) ) THEN
*
*        Test error exits for the least squares driver routines.
*
*        csgels
*
         SRNAMT = 'csgels '
         INFOT = 1
         CALL csgels( '/', 0, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgels( 'N', -1, 0, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgels( 'N', 0, -1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgels( 'N', 0, 0, -1, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgels( 'N', 2, 0, 0, A, 1, B, 2, W, 2, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgels( 'N', 2, 0, 0, A, 2, B, 1, W, 2, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgels( 'N', 1, 1, 0, A, 1, B, 1, W, 1, INFO )
         CALL CHKXER( 'csgels ', INFOT, NOUT, LERR, OK )
*
*        csgelsS
*
         SRNAMT = 'csgelsS'
         INFOT = 1
         CALL csgelsS( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, INFO 
     $  ) 
         CALL CHKXER( 'csgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgelsS( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 1, INFO 
     $  ) 
         CALL CHKXER( 'csgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgelsS( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 1, INFO 
     $  ) 
         CALL CHKXER( 'csgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgelsS( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 2, INFO 
     $  ) 
         CALL CHKXER( 'csgelsS', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgelsS( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 2, INFO 
     $  ) 
         CALL CHKXER( 'csgelsS', INFOT, NOUT, LERR, OK )
*
*        csgelsX
*
         SRNAMT = 'csgelsX'
         INFOT = 1
         CALL csgelsX( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, INFO )
         CALL CHKXER( 'csgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgelsX( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, INFO )
         CALL CHKXER( 'csgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgelsX( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, INFO )
         CALL CHKXER( 'csgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgelsX( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, INFO )
         CALL CHKXER( 'csgelsX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgelsX( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, INFO )
         CALL CHKXER( 'csgelsX', INFOT, NOUT, LERR, OK )
*
*        csgelsY
*
         SRNAMT = 'csgelsY'
         INFOT = 1
         CALL csgelsY( -1, 0, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10,
     $                INFO )
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgelsY( 0, -1, 0, A, 1, B, 1, IP, RCOND, IRNK, W, 10,
     $                INFO )
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgelsY( 0, 0, -1, A, 1, B, 1, IP, RCOND, IRNK, W, 10,
     $                INFO )
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgelsY( 2, 0, 0, A, 1, B, 2, IP, RCOND, IRNK, W, 10,
     $                INFO )
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgelsY( 2, 0, 0, A, 2, B, 1, IP, RCOND, IRNK, W, 10,
     $                INFO )
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgelsY( 2, 2, 1, A, 2, B, 2, IP, RCOND, IRNK, W, 1, INFO 
     $  ) 
         CALL CHKXER( 'csgelsY', INFOT, NOUT, LERR, OK )
*
*        csgelsD
*
         SRNAMT = 'csgelsD'
         INFOT = 1
         CALL csgelsD( -1, 0, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                IP, INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgelsD( 0, -1, 0, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                IP, INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgelsD( 0, 0, -1, A, 1, B, 1, S, RCOND, IRNK, W, 10,
     $                IP, INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgelsD( 2, 0, 0, A, 1, B, 2, S, RCOND, IRNK, W, 10,
     $                IP, INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgelsD( 2, 0, 0, A, 2, B, 1, S, RCOND, IRNK, W, 10,
     $                IP, INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgelsD( 2, 2, 1, A, 2, B, 2, S, RCOND, IRNK, W, 1, IP,
     $                INFO )
         CALL CHKXER( 'csgelsD', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRLS
*
      END
