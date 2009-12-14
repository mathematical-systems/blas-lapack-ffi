      SUBROUTINE DERRED( PATH, NUNIT )
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
*  DERRED tests the error exits for the eigenvalue driver routines for
*  DOUBLE PRECISION matrices:
*
*  PATH  driver   description
*  ----  ------   -----------
*  SEV   cdgeev    find eigenvalues/eigenvectors for nonsymmetric A
*  SES   cdgees    find eigenvalues/Schur form for nonsymmetric A
*  SVX   cdgeevX   csgeev + balancing and condition estimation
*  SSX   cdgeesX   csgees + balancing and condition estimation
*  DBD   cdgesvD   compute SVD of an M-by-N matrix A
*        cdgesdd   compute SVD of an M-by-N matrix A (by divide and
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
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( NMAX = 4, ONE = 1.0D0, ZERO = 0.0D0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, NT, SDIM
      DOUBLE PRECISION   ABNRM
*     ..
*     .. Local Arrays ..
      LOGICAL            B( NMAX )
      INTEGER            IW( 2*NMAX )
      DOUBLE PRECISION   A( NMAX, NMAX ), R1( NMAX ), R2( NMAX ),
     $                   S( NMAX ), U( NMAX, NMAX ), VL( NMAX, NMAX ),
     $                   VR( NMAX, NMAX ), VT( NMAX, NMAX ),
     $                   W( 4*NMAX ), WI( NMAX ), WR( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, cdgees, cdgeesX, cdgeev, cdgeevX, cdgesdd,
     $                   cdgesvD
*     ..
*     .. External Functions ..
      LOGICAL            DSLECT, LSAMEN
      EXTERNAL           DSLECT, LSAMEN
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
*        Test cdgeev
*
         SRNAMT = 'cdgeev '
         INFOT = 1
         CALL cdgeev( 'X', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgeev( 'N', 'X', 0, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgeev( 'N', 'N', -1, A, 1, WR, WI, VL, 1, VR, 1, W, 1,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgeev( 'N', 'N', 2, A, 1, WR, WI, VL, 1, VR, 1, W, 6,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdgeev( 'V', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1, W, 8,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdgeev( 'N', 'V', 2, A, 2, WR, WI, VL, 1, VR, 1, W, 8,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdgeev( 'V', 'V', 1, A, 1, WR, WI, VL, 1, VR, 1, W, 3,
     $               INFO )
         CALL CHKXER( 'cdgeev ', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'ES' ) ) THEN
*
*        Test cdgees
*
         SRNAMT = 'cdgees '
         INFOT = 1
         CALL cdgees( 'X', 'N', DSLECT, 0, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgees( 'N', 'X', DSLECT, 0, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cdgees( 'N', 'S', DSLECT, -1, A, 1, SDIM, WR, WI, VL, 1, W,
     $               1, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdgees( 'N', 'S', DSLECT, 2, A, 1, SDIM, WR, WI, VL, 1, W,
     $               6, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdgees( 'V', 'S', DSLECT, 2, A, 2, SDIM, WR, WI, VL, 1, W,
     $               6, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdgees( 'N', 'S', DSLECT, 1, A, 1, SDIM, WR, WI, VL, 1, W,
     $               2, B, INFO )
         CALL CHKXER( 'cdgees ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
      ELSE IF( LSAMEN( 2, C2, 'VX' ) ) THEN
*
*        Test cdgeevX
*
         SRNAMT = 'cdgeevX'
         INFOT = 1
        CALL cdgeevX( 'X', 'N', 'N', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdgeevX( 'N', 'X', 'N', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdgeevX( 'N', 'N', 'X', 'N', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cdgeevX( 'N', 'N', 'N', 'X', 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgeevX( 'N', 'N', 'N', 'N', -1, A, 1, WR, WI, VL, 1, VR,
     $                1, ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdgeevX( 'N', 'N', 'N', 'N', 2, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdgeevX( 'N', 'V', 'N', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 6, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cdgeevX( 'N', 'N', 'V', 'N', 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 6, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL cdgeevX( 'N', 'N', 'N', 'N', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL cdgeevX( 'N', 'V', 'N', 'N', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 2, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         INFOT = 21
        CALL cdgeevX( 'N', 'N', 'V', 'V', 1, A, 1, WR, WI, VL, 1, VR, 1,
     $                ILO, IHI, S, ABNRM, R1, R2, W, 3, IW, INFO )
         CALL CHKXER( 'cdgeevX', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
      ELSE IF( LSAMEN( 2, C2, 'SX' ) ) THEN
*
*        Test cdgeesX
*
         SRNAMT = 'cdgeesX'
         INFOT = 1
         CALL cdgeesX( 'X', 'N', DSLECT, 'N', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgeesX( 'N', 'X', DSLECT, 'N', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgeesX( 'N', 'N', DSLECT, 'X', 0, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cdgeesX( 'N', 'N', DSLECT, 'N', -1, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 1, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdgeesX( 'N', 'N', DSLECT, 'N', 2, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 6, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdgeesX( 'V', 'N', DSLECT, 'N', 2, A, 2, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 6, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdgeesX( 'N', 'N', DSLECT, 'N', 1, A, 1, SDIM, WR, WI, VL,
     $                1, R1( 1 ), R2( 1 ), W, 2, IW, 1, B, INFO )
         CALL CHKXER( 'cdgeesX', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
      ELSE IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        Test cdgesvD
*
         SRNAMT = 'cdgesvD'
         INFOT = 1
        CALL cdgesvD( 'X', 'N', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdgesvD( 'N', 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdgesvD( 'O', 'O', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgesvD( 'N', 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgesvD( 'N', 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdgesvD( 'N', 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdgesvD( 'A', 'N', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdgesvD( 'N', 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, INFO )
         CALL CHKXER( 'cdgesvD', INFOT, NOUT, LERR, OK )
         NT = NT + 8
         IF( OK ) THEN
            WRITE( NOUT, FMT = 9999 )SRNAMT, NT
         ELSE
            WRITE( NOUT, FMT = 9998 )
         END IF
*
*        Test cdgesdd
*
         SRNAMT = 'cdgesdd'
         INFOT = 1
         CALL cdgesdd( 'X', 0, 0, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdgesdd( 'N', -1, 0, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdgesdd( 'N', 0, -1, A, 1, S, U, 1, VT, 1, W, 1, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgesdd( 'N', 2, 1, A, 1, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdgesdd( 'A', 2, 1, A, 2, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdgesdd( 'A', 1, 2, A, 1, S, U, 1, VT, 1, W, 5, IW, INFO )
         CALL CHKXER( 'cdgesdd', INFOT, NOUT, LERR, OK )
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
*     End of DERRED
      END
