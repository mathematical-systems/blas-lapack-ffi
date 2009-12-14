      SUBROUTINE ZERRED( PATH, NUNIT )
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
*  ZERRED tests the error exits for the eigenvalue driver routines for
*  DOUBLE PRECISION matrices:
*
*  PATH  driver   description
*  ----  ------   -----------
*  ZEV   czgeev    find eigenvalues/eigenvectors for nonsymmetric A
*  ZES   czgees    find eigenvalues/Schur form for nonsymmetric A
*  ZVX   czgeevX   czgeev + balancing and condition estimation
*  ZSX   czgeesX   czgees + balancing and condition estimation
*  ZBD   czgesvD   compute SVD of an M-by-N matrix A
*        czgesdd   compute SVD of an M-by-N matrix A(by divide and
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
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( ONE = 1.0D0, ZERO = 0.0D0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, NT, SDIM
      DOUBLE PRECISION   ABNRM
*     ..
*     .. Local Arrays ..
      LOGICAL            B( NMAX )
      INTEGER            IW( 4*NMAX )
      DOUBLE PRECISION   R1( NMAX ), R2( NMAX ), RW( LW ), S( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), U( NMAX, NMAX ),
     $                   VL( NMAX, NMAX ), VR( NMAX, NMAX ),
     $                   VT( NMAX, NMAX ), W( 4*NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, czgees, czgeesX, czgeev, czgeevX, czgesdd,
     $                   czgesvD
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN, ZSLECT
      EXTERNAL           LSAMEN, ZSLECT
*     ..
*     .. Arrays in Common ..
      LOGICAL            SELVAL( 20 )
      DOUBLE PRECISION   SELWI( 20 ), SELWR( 20 )
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
*        Test czgeev
*
         SRNAMT = 'czgeev '
         INFOT = 1
         CALL czgeev( 'X', 'N', 0, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgeev( 'N', 'X', 0, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgeev( 'N', 'N', -1, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgeev( 'N', 'N', 2, A, 1, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgeev( 'V', 'N', 2, A, 2, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgeev( 'N', 'V', 2, A, 2, X, VL, 1, VR, 1, W, 4, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgeev( 'V', 'V', 1, A, 1, X, VL, 1, VR, 1, W, 1, RW,
     $               INFO )
         CALL CHKXER( 'czgeev ', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'ES' ) ) THEN
*
*        Test czgees
*
         SRNAMT = 'czgees '
         INFOT = 1
         CALL czgees( 'X', 'N', ZSLECT, 0, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgees( 'N', 'X', ZSLECT, 0, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgees( 'N', 'S', ZSLECT, -1, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgees( 'N', 'S', ZSLECT, 2, A, 1, SDIM, X, VL, 1, W, 4,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgees( 'V', 'S', ZSLECT, 2, A, 2, SDIM, X, VL, 1, W, 4,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgees( 'N', 'S', ZSLECT, 1, A, 1, SDIM, X, VL, 1, W, 1,
     $               RW, B, INFO )
         CALL CHKXER( 'czgees ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
      ELSE IF( LSAMEN( 2, C2, 'VX' ) ) THEN
*
*        Test czgeevX
*
         SRNAMT = 'czgeevX'
         INFOT = 1
         CALL czgeevX('X', 'N', 'N', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgeevX('N', 'X', 'N', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgeevX('N', 'N', 'X', 'N', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgeevX('N', 'N', 'N', 'X', 0, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgeevX( 'N', 'N', 'N', 'N', -1, A, 1, X, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgeevX('N', 'N', 'N', 'N', 2, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgeevX('N', 'V', 'N', 'N', 2, A, 2, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgeevX('N', 'N', 'V', 'N', 2, A, 2, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL czgeevX('N', 'N', 'N', 'N', 1, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL czgeevX('N', 'N', 'V', 'V', 1, A, 1, X, VL, 1, VR, 1, ILO,
     $                IHI, S, ABNRM, R1, R2, W, 2, RW, INFO )
         CALL CHKXER( 'czgeevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
      ELSE IF( LSAMEN( 2, C2, 'SX' ) ) THEN
*
*        Test czgeesX
*
         SRNAMT = 'czgeesX'
         INFOT = 1
         CALL czgeesX( 'X', 'N', ZSLECT, 'N', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgeesX( 'N', 'X', ZSLECT, 'N', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgeesX( 'N', 'N', ZSLECT, 'X', 0, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgeesX( 'N', 'N', ZSLECT, 'N', -1, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgeesX( 'N', 'N', ZSLECT, 'N', 2, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 4, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czgeesX( 'V', 'N', ZSLECT, 'N', 2, A, 2, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 4, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czgeesX( 'N', 'N', ZSLECT, 'N', 1, A, 1, SDIM, X, VL, 1,
     $                R1( 1 ), R2( 1 ), W, 1, RW, B, INFO )
         CALL CHKXER( 'czgeesX', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        Test czgesvD
*
         SRNAMT = 'czgesvD'
         INFOT = 1
         CALL czgesvD( 'X', 'N', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgesvD( 'N', 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgesvD( 'O', 'O', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgesvD( 'N', 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgesvD( 'N', 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgesvD( 'N', 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czgesvD( 'A', 'N', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czgesvD( 'N', 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, RW,
     $                INFO )
         CALL CHKXER( 'czgesvD', INFOT, NOUT, LERR, OK )
         NT = NT + 8
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )SRNAMT, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )
         END IF
*
*        Test czgesdd
*
         SRNAMT = 'czgesdd'
         INFOT = 1
         CALL czgesdd( 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgesdd( 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgesdd( 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgesdd( 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgesdd( 'A', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgesdd( 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, RW, IW,
     $                INFO )
         CALL CHKXER( 'czgesdd', INFOT, NOUT, LERR, OK )
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
*     End of ZERRED
*
      END
