      SUBROUTINE ZERRGT( PATH, NUNIT )
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
*  ZERRGT tests the error exits for the COMPLEX*16 tridiagonal
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
      DOUBLE PRECISION   ANORM, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      DOUBLE PRECISION   D( NMAX ), DF( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   RW( NMAX )
      COMPLEX*16         B( NMAX ), DL( NMAX ), DLF( NMAX ), DU( NMAX ),
     $                   DU2( NMAX ), DUF( NMAX ), E( NMAX ),
     $                   EF( NMAX ), W( NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, czgtcon, czgtrfs, czgttrf, czgttrs,
     $                   czptcon, czptrfs, czpttrf, czpttrs
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
         D( I ) = 1.D0
         E( I ) = 2.D0
         DL( I ) = 3.D0
         DU( I ) = 4.D0
   10 CONTINUE
      ANORM = 1.0D0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        Test error exits for the general tridiagonal routines.
*
*        czgttrf
*
         SRNAMT = 'czgttrf'
         INFOT = 1
         CALL czgttrf( -1, DL, E, DU, DU2, IP, INFO )
         CALL CHKXER( 'czgttrf', INFOT, NOUT, LERR, OK )
*
*        czgttrs
*
         SRNAMT = 'czgttrs'
         INFOT = 1
         CALL czgttrs( '/', 0, 0, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'czgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgttrs( 'N', -1, 0, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'czgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgttrs( 'N', 0, -1, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'czgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgttrs( 'N', 2, 1, DL, E, DU, DU2, IP, X, 1, INFO )
         CALL CHKXER( 'czgttrs', INFOT, NOUT, LERR, OK )
*
*        czgtrfs
*
         SRNAMT = 'czgtrfs'
         INFOT = 1
        CALL czgtrfs( '/', 0, 0, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 1,
     $                X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgtrfs( 'N', -1, 0, DL, E, DU, DLF, EF, DUF, DU2, IP, B,
     $                1, X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgtrfs( 'N', 0, -1, DL, E, DU, DLF, EF, DUF, DU2, IP, B,
     $                1, X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL czgtrfs( 'N', 2, 1, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 1,
     $                X, 2, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL czgtrfs( 'N', 2, 1, DL, E, DU, DLF, EF, DUF, DU2, IP, B, 2,
     $                X, 1, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtrfs', INFOT, NOUT, LERR, OK )
*
*        czgtcon
*
         SRNAMT = 'czgtcon'
         INFOT = 1
         CALL czgtcon( '/', 0, DL, E, DU, DU2, IP, ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'czgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgtcon( 'I', -1, DL, E, DU, DU2, IP, ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'czgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgtcon( 'I', 0, DL, E, DU, DU2, IP, -ANORM, RCOND, W,
     $                INFO )
         CALL CHKXER( 'czgtcon', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        Test error exits for the positive definite tridiagonal
*        routines.
*
*        czpttrf
*
         SRNAMT = 'czpttrf'
         INFOT = 1
         CALL czpttrf( -1, D, E, INFO )
         CALL CHKXER( 'czpttrf', INFOT, NOUT, LERR, OK )
*
*        czpttrs
*
         SRNAMT = 'czpttrs'
         INFOT = 1
         CALL czpttrs( '/', 1, 0, D, E, X, 1, INFO )
         CALL CHKXER( 'czpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpttrs( 'U', -1, 0, D, E, X, 1, INFO )
         CALL CHKXER( 'czpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpttrs( 'U', 0, -1, D, E, X, 1, INFO )
         CALL CHKXER( 'czpttrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czpttrs( 'U', 2, 1, D, E, X, 1, INFO )
         CALL CHKXER( 'czpttrs', INFOT, NOUT, LERR, OK )
*
*        czptrfs
*
         SRNAMT = 'czptrfs'
         INFOT = 1
         CALL czptrfs( '/', 1, 0, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'czptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czptrfs( 'U', -1, 0, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'czptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czptrfs( 'U', 0, -1, D, E, DF, EF, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'czptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czptrfs( 'U', 2, 1, D, E, DF, EF, B, 1, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'czptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czptrfs( 'U', 2, 1, D, E, DF, EF, B, 2, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'czptrfs', INFOT, NOUT, LERR, OK )
*
*        czptcon
*
         SRNAMT = 'czptcon'
         INFOT = 1
         CALL czptcon( -1, D, E, ANORM, RCOND, RW, INFO )
         CALL CHKXER( 'czptcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czptcon( 0, D, E, -ANORM, RCOND, RW, INFO )
         CALL CHKXER( 'czptcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRGT
*
      END
