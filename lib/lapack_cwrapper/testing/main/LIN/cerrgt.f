      SUBROUTINE CERRGT( PATH, NUNIT )
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
*  CERRGT tests the error exits for the COMPLEX tridiagonal
*  routines.
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
      INTEGER            I, INFO
      REAL               ANORM, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      REAL               D( NMAX ), DF( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   RW( NMAX )
      COMPLEX            B( NMAX ), DL( NMAX ), DLF( NMAX ), DU( NMAX ),
     $                   DU2( NMAX ), DUF( NMAX ), E( NMAX ),
     $                   EF( NMAX ), W( NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL    ALAESM, ccgtcon, ccgtrfs, ccgttrf, ccgttrs, CHKXER,
     $                   ccptcon, ccptrfs, ccpttrf, ccpttrs
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
      DO 10 I = 1, NMAX
         D( I ) = 1.
         E( I ) = 2.
         DL( I ) = 3.
         DU( I ) = 4.
   10 CONTINUE
      ANORM = 1.0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        Test error exits for the general tridiagonal routines.
*
*        ccgttrf
*
         SRNAMT = 'ccgttrf'
         INFOT = 1
         CALL ccgttrf( -1, DL, E, DU, DU2, IP, INFO )
         CALL CHKXER( 'ccgttrf', INFOT, NOUT, LERR, OK )
*
*        ccgttrs
*
         SRNAMT = 'ccgttrs'
         INFOT = 1
         CALL ccgttrs( '/', 0, 0, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'ccgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgttrs( 'N', -1, 0, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'ccgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgttrs( 'N', 0, -1, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'ccgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgttrs( 'N', 2, 1, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'ccgttrs', INFOT, NOUT, LERR, OK )
*
*        ccgtrfs
*
         SRNAMT = 'ccgtrfs'
         INFOT = 1
        CALL ccgtrfs( '/', 0, 0, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 1,
     $                X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgtrfs( 'N', -1, 0, DL, E, DU, DLF, EF, DUF, DU2, IP, B,
     $                1, X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgtrfs( 'N', 0, -1, DL, E, DU, DLF, EF, DUF, DU2, IP, B,
     $                1, X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL ccgtrfs( 'N', 2, 1, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 1,
     $                X, 2, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL ccgtrfs( 'N', 2, 1, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 2,
     $                X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'ccgtrfs', INFOT, NOUT, LERR, OK )
*
*        ccgtcon
*
         SRNAMT = 'ccgtcon'
         INFOT = 1
         CALL ccgtcon( '/', 0, DL, E, DU, DU2, IP, ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'ccgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgtcon( 'I', -1, DL, E, DU, DU2, IP, ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'ccgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgtcon( 'I', 0, DL, E, DU, DU2, IP, -ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'ccgtcon', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        Test error exits for the positive definite tridiagonal
*        routines.
*
*        ccpttrf
*
         SRNAMT = 'ccpttrf'
         INFOT = 1
         CALL ccpttrf( -1, D, E, INFO )
         CALL CHKXER( 'ccpttrf', INFOT, NOUT, LERR, OK )
*
*        ccpttrs
*
         SRNAMT = 'ccpttrs'
         INFOT = 1
         CALL ccpttrs( '/', 1, 0, D, E, X, 1, INFO )
         CALL CHKXER( 'ccpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpttrs( 'U', -1, 0, D, E, X, 1, INFO )
         CALL CHKXER( 'ccpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpttrs( 'U', 0, -1, D, E, X, 1, INFO )
         CALL CHKXER( 'ccpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccpttrs( 'U', 2, 1, D, E, X, 1, INFO )
         CALL CHKXER( 'ccpttrs', INFOT, NOUT, LERR, OK )
*
*        ccptrfs
*
         SRNAMT = 'ccptrfs'
         INFOT = 1
         CALL ccptrfs( '/', 1, 0, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'ccptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccptrfs( 'U', -1, 0, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'ccptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccptrfs( 'U', 0, -1, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'ccptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccptrfs( 'U', 2, 1, D, E, DF, EF, B, 1, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'ccptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccptrfs( 'U', 2, 1, D, E, DF, EF, B, 2, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'ccptrfs', INFOT, NOUT, LERR, OK )
*
*        ccptcon
*
         SRNAMT = 'ccptcon'
         INFOT = 1
         CALL ccptcon( -1, D, E, ANORM, RCOND, RW, INFO )
         CALL CHKXER( 'ccptcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccptcon( 0, D, E, -ANORM, RCOND, RW, INFO )
         CALL CHKXER( 'ccptcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRGT
*
      END
