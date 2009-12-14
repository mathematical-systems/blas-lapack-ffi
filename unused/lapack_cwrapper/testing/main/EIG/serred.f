      SUBROUTINE SERRED( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     December 22, 1999
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  SERRED tests the error exits for the eigenvalue driver routines for
*  REAL matrices:
*
*  PATH  driver   description
*  ----  ------   -----------
*  SEV   csgeev    find eigenvalues/eigenvectors for nonsymmetric A
*  SES   csgees    find eigenvalues/Schur form for nonsymmetric A
*  SVX   csgeevX   csgeev + balancing and condition estimation
*  SSX   csgeesX   csgees + balancing and condition estimation
*  SBD   csgesvD   compute SVD of an M-by-N matrix A
*        csgesdd   compute SVD of an M-by-N matrix A (by divide and
*                 conquer)
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
      REAL               ONE, ZERO
      PARAMETER          ( NMAX = 4, ONE = 1.0E0, ZERO = 0.0E0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, NT, SDIM
      REAL               ABNRM
*     ..
*     .. Local Arrays ..
      LOGICAL            B( NMAX )
      INTEGER            IW( 2*NMAX )
      REAL               A( NMAX, NMAX ), R1( NMAX ), R2( NMAX ),
     $                   S( NMAX ), U( NMAX, NMAX ), VL( NMAX, NMAX ),
     $                   VR( NMAX, NMAX ), VT( NMAX, NMAX ),
     $                   W( 4*NMAX ), WI( NMAX ), WR( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, csgees, csgeesX, csgeev, csgeevX, csgesdd,
     $                   csgesvD
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN, SSLECT
      EXTERNAL           LSAMEN, SSLECT
*     ..
*     .. Arrays in Common ..
      LOGICAL            SELVAL( 20 )
      REAL               SELWI( 20 ), SELWR( 20 )
*     ..
*     .. Scalars in Common ..
      LOGICAL            LERR, OK
      CHARACTER*7        SRNAMT
      INTEGER            INFOT, NOUT, SELDIM, SELOPT
*     ..
*     .. Common blocks ..
      COMMON             / INFOC / INFOT, NOUT, OK, LERR
      COMMON             / SRNAMC / SRNAMT
      COMMON             / SSLCT / SELOPT, SELDIM, SELVAL, SELWR, SELWI
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
*
*     Initialize A
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = ZERO
   10    CONTINUE
   20 CONTINUE
      DO 30 I = 1, NMAX
         A( I, I ) = ONE
   30 CONTINUE
      OK = .TRUE.
      NT = 0
*
      IF( LSAMEN( 2, C2, 'EV' ) ) THEN
*
*        Test csgeev
*
         SRNAMT = 'csgeev '
         INFOT = 1
         CALL csgeev( 'X', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgeev( 'N', 'X', 0, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgeev( 'N', 'N', -1, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgeev( 'N', 'N', 2, A, 1, WR, WI, VL, 1, VR, 1, W, 6,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csgeev( 'V', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1, W, 8,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csgeev( 'N', 'V', 2, A, 2, WR, WI, VL, 1, VR, 1, W, 8,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csgeev( 'V', 'V', 1, A, 1, WR, WI, VL, 1, VR, 1, W, 3,
     $               INFO )
         CALL CHKXER( 'csgeev ', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'ES' ) ) THEN
*
*        Test csgees
*
         SRNAMT = 'csgees '
         INFOT = 1
         CALL csgees( 'X', 'N', SSLECT, 0, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgees( 'N', 'X', SSLECT, 0, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL csgees( 'N', 'S', SSLECT, -1, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgees( 'N', 'S', SSLECT, 2, A, 1, SDIM, WR, WI, VL, 1, W,
     $               6, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csgees( 'V', 'S', SSLECT, 2, A, 2, SDIM, WR, WI, VL, 1, W,
     $               6, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csgees( 'N', 'S', SSLECT, 1, A, 1, SDIM, WR, WI, VL, 1, W,
     $               2, B, INFO )
         CALL CHKXER( 'csgees ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
      ELSE IF( LSAMEN( 2, C2, 'VX' ) ) THEN
*
*        Test csgeevX
*
         SRNAMT = 'csgeevX'
         INFOT = 1
        CALL csgeevX( 'X', 'N', 'N', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csgeevX( 'N', 'X', 'N', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csgeevX( 'N', 'N', 'X', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL csgeevX( 'N', 'N', 'N', 'X', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgeevX( 'N', 'N', 'N', 'N', -1, A, 1, WR, WI, VL, 1, VR,
     $                1, ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csgeevX( 'N', 'N', 'N', 'N', 2, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL csgeevX( 'N', 'V', 'N', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 6, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL csgeevX( 'N', 'N', 'V', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 6, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL csgeevX( 'N', 'N', 'N', 'N', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL csgeevX( 'N', 'V', 'N', 'N', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 2, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL csgeevX( 'N', 'N', 'V', 'V', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 3, IW, INFO )
         CALL CHKXER( 'csgeevX', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
      ELSE IF( LSAMEN( 2, C2, 'SX' ) ) THEN
*
*        Test csgeesX
*
         SRNAMT = 'csgeesX'
         INFOT = 1
         CALL csgeesX( 'X', 'N', SSLECT, 'N', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgeesX( 'N', 'X', SSLECT, 'N', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgeesX( 'N', 'N', SSLECT, 'X', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL csgeesX( 'N', 'N', SSLECT, 'N', -1, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgeesX( 'N', 'N', SSLECT, 'N', 2, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 6, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgeesX( 'V', 'N', SSLECT, 'N', 2, A, 2, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 6, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csgeesX( 'N', 'N', SSLECT, 'N', 1, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 2, IW, 1, B, INFO )
         CALL CHKXER( 'csgeesX', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        Test csgesvD
*
         SRNAMT = 'csgesvD'
         INFOT = 1
        CALL csgesvD( 'X', 'N', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csgesvD( 'N', 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csgesvD( 'O', 'O', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgesvD( 'N', 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgesvD( 'N', 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL csgesvD( 'N', 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL csgesvD( 'A', 'N', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL csgesvD( 'N', 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'csgesvD', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        Test csgesdd
*
         SRNAMT = 'csgesdd'
         INFOT = 1
         CALL csgesdd( 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csgesdd( 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csgesdd( 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgesdd( 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgesdd( 'A', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgesdd( 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'csgesdd', INFOT, NOUT, LERR, OK )
         NT = NT + 6
      END IF
*
*     Print a summary line.
*
      IF( .NOT.LSAMEN( 2, C2, 'BD' ) ) THEN
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )PATH, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )PATH
         END IF
      END IF
*
 9999 FORMAT( 1X, A3, ' routines passed the tests of the error exits (',
     $        I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ex',
     $        'its ***' )
      RETURN
*
*     End of SERRED
*
      END
