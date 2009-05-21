      SUBROUTINE CERRED( PATH, NUNIT )
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
*  CERRED tests the error exits for the eigenvalue driver routines for
*  REAL matrices:
*
*  PATH  driver   description
*  ----  ------   -----------
*  CEV   ccgeev    find eigenvalues/eigenvectors for nonsymmetric A
*  CES   ccgees    find eigenvalues/Schur form for nonsymmetric A
*  CVX   ccgeevX   ccgeev + balancing and condition estimation
*  CSX   ccgeesX   ccgees + balancing and condition estimation
*  CBD   ccgesvD   compute SVD of an M-by-N matrix A
*        ccgesdd   compute SVD of an M-by-N matrix A(by divide and
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
      INTEGER            NMAX, LW
      PARAMETER          ( NMAX = 4, LW = 5*NMAX )
      REAL               ONE, ZERO
      PARAMETER          ( ONE = 1.0E0, ZERO = 0.0E0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, NT, SDIM
      REAL               ABNRM
*     ..
*     .. Local Arrays ..
      LOGICAL            B( NMAX )
      INTEGER            IW( 4*NMAX )
      REAL               R1( NMAX ), R2( NMAX ), RW( LW ), S( NMAX )
      COMPLEX            A( NMAX, NMAX ), U( NMAX, NMAX ),
     $                   VL( NMAX, NMAX ), VR( NMAX, NMAX ),
     $                   VT( NMAX, NMAX ), W( 4*NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL       ccgees, ccgeesX, ccgeev, ccgeevX, ccgesdd, ccgesvD,
     $                   CHKXER
*     ..
*     .. External Functions ..
      LOGICAL            CSLECT, LSAMEN
      EXTERNAL           CSLECT, LSAMEN
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
*        Test ccgeev
*
         SRNAMT = 'ccgeev '
         INFOT = 1
         CALL ccgeev( 'X', 'N', 0, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeev( 'N', 'X', 0, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgeev( 'N', 'N', -1, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgeev( 'N', 'N', 2, A, 1, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgeev( 'V', 'N', 2, A, 2, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgeev( 'N', 'V', 2, A, 2, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgeev( 'V', 'V', 1, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'ccgeev ', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'ES' ) ) THEN
*
*        Test ccgees
*
         SRNAMT = 'ccgees '
         INFOT = 1
         CALL ccgees( 'X', 'N', CSLECT, 0, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgees( 'N', 'X', CSLECT, 0, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgees( 'N', 'S', CSLECT, -1, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgees( 'N', 'S', CSLECT, 2, A, 1, SDIM, X, VL, 1, W, 4,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgees( 'V', 'S', CSLECT, 2, A, 2, SDIM, X, VL, 1, W, 4,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgees( 'N', 'S', CSLECT, 1, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'ccgees ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
      ELSE IF( LSAMEN( 2, C2, 'VX' ) ) THEN
*
*        Test ccgeevX
*
         SRNAMT = 'ccgeevX'
         INFOT = 1
         CALL ccgeevX('X', 'N', 'N', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeevX('N', 'X', 'N', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgeevX('N', 'N', 'X', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgeevX('N', 'N', 'N', 'X', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgeevX( 'N', 'N', 'N', 'N', -1, A, 1, X, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgeevX('N', 'N', 'N', 'N', 2, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgeevX('N', 'V', 'N', 'N', 2, A, 2, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgeevX('N', 'N', 'V', 'N', 2, A, 2, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL ccgeevX('N', 'N', 'N', 'N', 1, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL ccgeevX('N', 'N', 'V', 'V', 1, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 2, RW, INFO )
         CALL CHKXER( 'ccgeevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
      ELSE IF( LSAMEN( 2, C2, 'SX' ) ) THEN
*
*        Test ccgeesX
*
         SRNAMT = 'ccgeesX'
         INFOT = 1
         CALL ccgeesX( 'X', 'N', CSLECT, 'N', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeesX( 'N', 'X', CSLECT, 'N', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgeesX( 'N', 'N', CSLECT, 'X', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgeesX( 'N', 'N', CSLECT, 'N', -1, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgeesX( 'N', 'N', CSLECT, 'N', 2, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 4, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccgeesX( 'V', 'N', CSLECT, 'N', 2, A, 2, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 4, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL ccgeesX( 'N', 'N', CSLECT, 'N', 1, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'ccgeesX', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        Test ccgesvD
*
         SRNAMT = 'ccgesvD'
         INFOT = 1
         CALL ccgesvD( 'X', 'N', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgesvD( 'N', 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgesvD( 'O', 'O', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgesvD( 'N', 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgesvD( 'N', 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgesvD( 'N', 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccgesvD( 'A', 'N', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccgesvD( 'N', 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'ccgesvD', INFOT, NOUT, LERR, OK )
         NT = NT + 8
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )SRNAMT, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )
         END IF
*
*        Test ccgesdd
*
         SRNAMT = 'ccgesdd'
         INFOT = 1
         CALL ccgesdd( 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgesdd( 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgesdd( 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgesdd( 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgesdd( 'A', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgesdd( 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'ccgesdd', INFOT, NOUT, LERR, OK )
         NT = NT - 2
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )SRNAMT, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )
         END IF
      END IF
*
*     Print a summary line.
*
      IF( .NOT.LSAMEN( 2, C2, 'BD' ) ) THEN
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )SRNAMT, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )
         END IF
      END IF
*
 9999 FORMAT( 1X, A6, ' passed the tests of the error exits (', I3,
     $      ' tests done)' )
 9998 FORMAT( ' *** ', A6, ' failed the tests of the error exits ***' )
      RETURN
*
*     End of CERRED
*
      END
