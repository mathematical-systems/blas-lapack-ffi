      SUBROUTINE SERRGT( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  SERRGT tests the error exits for the REAL tridiagonal
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
      INTEGER            INFO
      REAL               ANORM, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX ), IW( NMAX )
      REAL               B( NMAX ), C( NMAX ), CF( NMAX ), D( NMAX ),
     $                   DF( NMAX ), E( NMAX ), EF( NMAX ), F( NMAX ),
     $                   R1( NMAX ), R2( NMAX ), W( NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgtcon, csgtrfs, csgttrf, 
     $  csgttrs, 
     $                   csptcon, csptrfs, cspttrf, cspttrs
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
      D( 1 ) = 1.
      D( 2 ) = 2.
      DF( 1 ) = 1.
      DF( 2 ) = 2.
      E( 1 ) = 3.
      E( 2 ) = 4.
      EF( 1 ) = 3.
      EF( 2 ) = 4.
      ANORM = 1.0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        Test error exits for the general tridiagonal routines.
*
*        csgttrf
*
         SRNAMT = 'csgttrf'
         INFOT = 1
         CALL csgttrf( -1, C, D, E, F, IP, INFO )
         CALL CHKXER( 'csgttrf', INFOT, NOUT, LERR, OK )
*
*        csgttrs
*
         SRNAMT = 'csgttrs'
         INFOT = 1
         CALL csgttrs( '/', 0, 0, C, D, E, F, IP, X, 1, INFO )
         CALL CHKXER( 'csgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgttrs( 'N', -1, 0, C, D, E, F, IP, X, 1, INFO )
         CALL CHKXER( 'csgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgttrs( 'N', 0, -1, C, D, E, F, IP, X, 1, INFO )
         CALL CHKXER( 'csgttrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgttrs( 'N', 2, 1, C, D, E, F, IP, X, 1, INFO )
         CALL CHKXER( 'csgttrs', INFOT, NOUT, LERR, OK )
*
*        csgtrfs
*
         SRNAMT = 'csgtrfs'
         INFOT = 1
         CALL csgtrfs( '/', 0, 0, C, D, E, CF, DF, EF, F, IP, B, 1, X, 
     $  1, 
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgtrfs( 'N', -1, 0, C, D, E, CF, DF, EF, F, IP, B, 1, X,
     $                1, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgtrfs( 'N', 0, -1, C, D, E, CF, DF, EF, F, IP, B, 1, X,
     $                1, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csgtrfs( 'N', 2, 1, C, D, E, CF, DF, EF, F, IP, B, 1, X, 
     $  2, 
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtrfs', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL csgtrfs( 'N', 2, 1, C, D, E, CF, DF, EF, F, IP, B, 2, X, 
     $  1, 
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtrfs', INFOT, NOUT, LERR, OK )
*
*        csgtcon
*
         SRNAMT = 'csgtcon'
         INFOT = 1
         CALL csgtcon( '/', 0, C, D, E, F, IP, ANORM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgtcon( 'I', -1, C, D, E, F, IP, ANORM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgtcon', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgtcon( 'I', 0, C, D, E, F, IP, -ANORM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgtcon', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        Test error exits for the positive definite tridiagonal
*        routines.
*
*        cspttrf
*
         SRNAMT = 'cspttrf'
         INFOT = 1
         CALL cspttrf( -1, D, E, INFO )
         CALL CHKXER( 'cspttrf', INFOT, NOUT, LERR, OK )
*
*        cspttrs
*
         SRNAMT = 'cspttrs'
         INFOT = 1
         CALL cspttrs( -1, 0, D, E, X, 1, INFO )
         CALL CHKXER( 'cspttrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspttrs( 0, -1, D, E, X, 1, INFO )
         CALL CHKXER( 'cspttrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspttrs( 2, 1, D, E, X, 1, INFO )
         CALL CHKXER( 'cspttrs', INFOT, NOUT, LERR, OK )
*
*        csptrfs
*
         SRNAMT = 'csptrfs'
         INFOT = 1
         CALL csptrfs( -1, 0, D, E, DF, EF, B, 1, X, 1, R1, R2, W, INFO 
     $  ) 
         CALL CHKXER( 'csptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csptrfs( 0, -1, D, E, DF, EF, B, 1, X, 1, R1, R2, W, INFO 
     $  ) 
         CALL CHKXER( 'csptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csptrfs( 2, 1, D, E, DF, EF, B, 1, X, 2, R1, R2, W, INFO 
     $  ) 
         CALL CHKXER( 'csptrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csptrfs( 2, 1, D, E, DF, EF, B, 2, X, 1, R1, R2, W, INFO 
     $  ) 
         CALL CHKXER( 'csptrfs', INFOT, NOUT, LERR, OK )
*
*        csptcon
*
         SRNAMT = 'csptcon'
         INFOT = 1
         CALL csptcon( -1, D, E, ANORM, RCOND, W, INFO )
         CALL CHKXER( 'csptcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csptcon( 0, D, E, -ANORM, RCOND, W, INFO )
         CALL CHKXER( 'csptcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRGT
*
      END
