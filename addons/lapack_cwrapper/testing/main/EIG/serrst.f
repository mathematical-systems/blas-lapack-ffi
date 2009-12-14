      SUBROUTINE SERRST( PATH, NUNIT )
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
*  SERRST tests the error exits for cssytrd, csorgtr, csormtr, cssptrd,
*  csopgtr, csopmtr, cssteqr, cssterf, csstebz, csstein, cspteqr, cssbtrd,
*  cssyev, cssyevX, cssyevD, cssbev, cssbevX, cssbevD,
*  csspev, csspevX, csspevD, csstev, csstevX, csstevD, and csstedc.
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
*     NMAX has to be at least 3 or LIW may be too small
*     .. Parameters ..
      INTEGER            NMAX, LIW, LW
      PARAMETER          ( NMAX = 3, LIW = 12*NMAX, LW = 20*NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J, M, N, NSPLIT, NT
*     ..
*     .. Local Arrays ..
      INTEGER            I1( NMAX ), I2( NMAX ), I3( NMAX ), IW( LIW )
      REAL               A( NMAX, NMAX ), C( NMAX, NMAX ), D( NMAX ),
     $                   E( NMAX ), Q( NMAX, NMAX ), R( NMAX ),
     $                   TAU( NMAX ), W( LW ), X( NMAX ),
     $                   Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, csopgtr, csopmtr, csorgtr, csormtr, cspteqr,
     $               cssbev, cssbevD, cssbevX, cssbtrd, csspev, csspevD,
     $             csspevX, cssptrd, csstebz, csstedc, csstein, cssteqr,
     $               cssterf, csstev, csstevD, csstevR, csstevX, cssyev,
     $                   cssyevD, cssyevR, cssyevX, cssytrd
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
*     .. Intrinsic Functions ..
      INTRINSIC          REAL
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = 1. / REAL( I+J )
   10    CONTINUE
   20 CONTINUE
      DO 30 J = 1, NMAX
         D( J ) = REAL( J )
         E( J ) = 0.0
         I1( J ) = J
         I2( J ) = J
         TAU( J ) = 1.
   30 CONTINUE
      OK = .TRUE.
      NT = 0
*
*     Test error exits for the ST path.
*
      IF( LSAMEN( 2, C2, 'ST' ) ) THEN
*
*        cssytrd
*
         SRNAMT = 'cssytrd'
         INFOT = 1
         CALL cssytrd( '/', 0, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cssytrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssytrd( 'U', -1, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cssytrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssytrd( 'U', 2, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cssytrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cssytrd( 'U', 0, A, 1, D, E, TAU, W, 0, INFO )
         CALL CHKXER( 'cssytrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        csorgtr
*
         SRNAMT = 'csorgtr'
         INFOT = 1
         CALL csorgtr( '/', 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csorgtr( 'U', -1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csorgtr( 'U', 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csorgtr( 'U', 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'csorgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        csormtr
*
         SRNAMT = 'csormtr'
         INFOT = 1
        CALL csormtr( '/', 'U', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csormtr( 'L', '/', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csormtr( 'L', 'U', '/', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csormtr( 'L', 'U', 'N', -1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csormtr( 'L', 'U', 'N', 0, -1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csormtr( 'L', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csormtr( 'R', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL csormtr( 'L', 'U', 'N', 2, 0, A, 2, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL csormtr( 'L', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL csormtr( 'R', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'csormtr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cssptrd
*
         SRNAMT = 'cssptrd'
         INFOT = 1
         CALL cssptrd( '/', 0, A, D, E, TAU, INFO )
         CALL CHKXER( 'cssptrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssptrd( 'U', -1, A, D, E, TAU, INFO )
         CALL CHKXER( 'cssptrd', INFOT, NOUT, LERR, OK )
         NT = NT + 2
*
*        csopgtr
*
         SRNAMT = 'csopgtr'
         INFOT = 1
         CALL csopgtr( '/', 0, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'csopgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csopgtr( 'U', -1, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'csopgtr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csopgtr( 'U', 2, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'csopgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        csopmtr
*
         SRNAMT = 'csopmtr'
         INFOT = 1
         CALL csopmtr( '/', 'U', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csopmtr( 'L', '/', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csopmtr( 'L', 'U', '/', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csopmtr( 'L', 'U', 'N', -1, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csopmtr( 'L', 'U', 'N', 0, -1, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csopmtr( 'L', 'U', 'N', 2, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'csopmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cspteqr
*
         SRNAMT = 'cspteqr'
         INFOT = 1
         CALL cspteqr( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cspteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspteqr( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cspteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspteqr( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cspteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        csstebz
*
         SRNAMT = 'csstebz'
         INFOT = 1
        CALL csstebz( '/', 'E', 0, 0.0, 1.0, 1, 0, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csstebz( 'A', '/', 0, 0.0, 0.0, 0, 0, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csstebz( 'A', 'E', -1, 0.0, 0.0, 0, 0, 0.0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL csstebz( 'V', 'E', 0, 0.0, 0.0, 0, 0, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL csstebz( 'I', 'E', 0, 0.0, 0.0, 0, 0, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL csstebz( 'I', 'E', 1, 0.0, 0.0, 2, 1, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csstebz( 'I', 'E', 1, 0.0, 0.0, 1, 0, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csstebz( 'I', 'E', 1, 0.0, 0.0, 1, 2, 0.0, D, E, M, NSPLIT,
     $                X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'csstebz', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        csstein
*
         SRNAMT = 'csstein'
         INFOT = 1
         CALL csstein( -1, D, E, 0, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'csstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csstein( 0, D, E, -1, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'csstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csstein( 0, D, E, 1, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'csstein', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csstein( 2, D, E, 0, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'csstein', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cssteqr
*
         SRNAMT = 'cssteqr'
         INFOT = 1
         CALL cssteqr( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssteqr( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cssteqr( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cssterf
*
         SRNAMT = 'cssterf'
         INFOT = 1
         CALL cssterf( -1, D, E, INFO )
         CALL CHKXER( 'cssterf', INFOT, NOUT, LERR, OK )
         NT = NT + 1
*
*        csstedc
*
         SRNAMT = 'csstedc'
         INFOT = 1
         CALL csstedc( '/', 0, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csstedc( 'N', -1, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csstedc( 'V', 2, D, E, Z, 1, W, 23, IW, 28, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstedc( 'N', 1, D, E, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstedc( 'I', 2, D, E, Z, 2, W, 0, IW, 12, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstedc( 'V', 2, D, E, Z, 2, W, 0, IW, 28, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csstedc( 'N', 1, D, E, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csstedc( 'I', 2, D, E, Z, 2, W, 19, IW, 0, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csstedc( 'V', 2, D, E, Z, 2, W, 23, IW, 0, INFO )
         CALL CHKXER( 'csstedc', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        csstevD
*
         SRNAMT = 'csstevD'
         INFOT = 1
         CALL csstevD( '/', 0, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csstevD( 'N', -1, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csstevD( 'V', 2, D, E, Z, 1, W, 19, IW, 12, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstevD( 'N', 1, D, E, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstevD( 'V', 2, D, E, Z, 2, W, 12, IW, 12, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csstevD( 'N', 0, D, E, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csstevD( 'V', 2, D, E, Z, 2, W, 19, IW, 11, INFO )
         CALL CHKXER( 'csstevD', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        csstev
*
         SRNAMT = 'csstev '
         INFOT = 1
         CALL csstev( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'csstev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csstev( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'csstev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csstev( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'csstev ', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        csstevX
*
         SRNAMT = 'csstevX'
         INFOT = 1
         CALL csstevX( '/', 'A', 0, D, E, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csstevX( 'N', '/', 0, D, E, 0.0, 1.0, 1, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csstevX( 'N', 'A', -1, D, E, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csstevX( 'N', 'V', 1, D, E, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstevX( 'N', 'I', 1, D, E, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstevX( 'N', 'I', 1, D, E, 0.0, 0.0, 2, 1, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csstevX( 'N', 'I', 2, D, E, 0.0, 0.0, 2, 1, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csstevX( 'N', 'I', 1, D, E, 0.0, 0.0, 1, 2, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csstevX( 'V', 'A', 2, D, E, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csstevX', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        csstevR
*
         N = 1
         SRNAMT = 'csstevR'
         INFOT = 1
         CALL csstevR( '/', 'A', 0, D, E, 0.0, 0.0, 1, 1, 0.0, M, R, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csstevR( 'V', '/', 0, D, E, 0.0, 0.0, 1, 1, 0.0, M, R, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csstevR( 'V', 'A', -1, D, E, 0.0, 0.0, 1, 1, 0.0, M, R, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csstevR( 'V', 'V', 1, D, E, 0.0, 0.0, 1, 1, 0.0, M, R, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csstevR( 'V', 'I', 1, D, E, 0.0, 0.0, 0, 1, 0.0, M, W, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
         N = 2
         CALL csstevR( 'V', 'I', 2, D, E, 0.0, 0.0, 2, 1, 0.0, M, W, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 14
         N = 1
         CALL csstevR( 'V', 'I', 1, D, E, 0.0, 0.0, 1, 1, 0.0, M, W, Z,
     $                0, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL csstevR( 'V', 'I', 1, D, E, 0.0, 0.0, 1, 1, 0.0, M, W, Z,
     $                1, IW, X, 20*N-1, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         INFOT = 19
         CALL csstevR( 'V', 'I', 1, D, E, 0.0, 0.0, 1, 1, 0.0, M, W, Z,
     $                1, IW, X, 20*N, IW( 2*N+1 ), 10*N-1, INFO )
         CALL CHKXER( 'csstevR', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cssyevD
*
         SRNAMT = 'cssyevD'
         INFOT = 1
         CALL cssyevD( '/', 'U', 0, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssyevD( 'N', '/', 0, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssyevD( 'N', 'U', -1, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cssyevD( 'N', 'U', 2, A, 1, X, W, 3, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssyevD( 'N', 'U', 1, A, 1, X, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssyevD( 'N', 'U', 2, A, 2, X, W, 4, IW, 1, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssyevD( 'V', 'U', 2, A, 2, X, W, 20, IW, 12, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssyevD( 'N', 'U', 1, A, 1, X, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssyevD( 'N', 'U', 2, A, 2, X, W, 5, IW, 0, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssyevD( 'V', 'U', 2, A, 2, X, W, 27, IW, 11, INFO )
         CALL CHKXER( 'cssyevD', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cssyevR
*
         SRNAMT = 'cssyevR'
         N = 1
         INFOT = 1
        CALL cssyevR( '/', 'A', 'U', 0, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cssyevR( 'V', '/', 'U', 0, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssyevR( 'V', 'A', '/', -1, A, 1, 0.0, 0.0, 1, 1, 0.0, M,
     $                R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssyevR( 'V', 'A', 'U', -1, A, 1, 0.0, 0.0, 1, 1, 0.0, M,
     $                R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cssyevR( 'V', 'A', 'U', 2, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssyevR( 'V', 'V', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cssyevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 0, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 10
*
         CALL cssyevR( 'V', 'I', 'U', 2, A, 2, 0.0E0, 0.0E0, 2, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cssyevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 0, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cssyevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 26*N-1, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cssyevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N-1,
     $                INFO )
         CALL CHKXER( 'cssyevR', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cssyev
*
         SRNAMT = 'cssyev '
         INFOT = 1
         CALL cssyev( '/', 'U', 0, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cssyev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssyev( 'N', '/', 0, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cssyev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssyev( 'N', 'U', -1, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cssyev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cssyev( 'N', 'U', 2, A, 1, X, W, 3, INFO )
         CALL CHKXER( 'cssyev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssyev( 'N', 'U', 1, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cssyev ', INFOT, NOUT, LERR, OK )
         NT = NT + 5
*
*        cssyevX
*
         SRNAMT = 'cssyevX'
         INFOT = 1
        CALL cssyevX( '/', 'A', 'U', 0, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cssyevX( 'N', '/', 'U', 0, A, 1, 0.0, 1.0, 1, 0, 0.0, M, X,
     $                Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cssyevX( 'N', 'A', '/', 0, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, IW, I3, INFO )
         INFOT = 4
         CALL cssyevX( 'N', 'A', 'U', -1, A, 1, 0.0, 0.0, 0, 0, 0.0, M,
     $                X, Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cssyevX( 'N', 'A', 'U', 2, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cssyevX( 'N', 'V', 'U', 1, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cssyevX( 'N', 'I', 'U', 1, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cssyevX( 'N', 'I', 'U', 1, A, 1, 0.0, 0.0, 2, 1, 0.0, M, X,
     $                Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cssyevX( 'N', 'I', 'U', 2, A, 2, 0.0, 0.0, 2, 1, 0.0, M, X,
     $                Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cssyevX( 'N', 'I', 'U', 1, A, 1, 0.0, 0.0, 1, 2, 0.0, M, X,
     $                Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cssyevX( 'V', 'A', 'U', 2, A, 2, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cssyevX( 'V', 'A', 'U', 1, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 0, IW, I3, INFO )
         CALL CHKXER( 'cssyevX', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        csspevD
*
         SRNAMT = 'csspevD'
         INFOT = 1
         CALL csspevD( '/', 'U', 0, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csspevD( 'N', '/', 0, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csspevD( 'N', 'U', -1, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csspevD( 'V', 'U', 2, A, X, Z, 1, W, 23, IW, 12, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csspevD( 'N', 'U', 1, A, X, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csspevD( 'N', 'U', 2, A, X, Z, 1, W, 3, IW, 1, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csspevD( 'V', 'U', 2, A, X, Z, 2, W, 16, IW, 12, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csspevD( 'N', 'U', 1, A, X, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csspevD( 'N', 'U', 2, A, X, Z, 1, W, 4, IW, 0, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csspevD( 'V', 'U', 2, A, X, Z, 2, W, 23, IW, 11, INFO )
         CALL CHKXER( 'csspevD', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        csspev
*
         SRNAMT = 'csspev '
         INFOT = 1
         CALL csspev( '/', 'U', 0, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'csspev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csspev( 'N', '/', 0, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'csspev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csspev( 'N', 'U', -1, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'csspev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csspev( 'V', 'U', 2, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'csspev ', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        csspevX
*
         SRNAMT = 'csspevX'
         INFOT = 1
        CALL csspevX( '/', 'A', 'U', 0, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csspevX( 'N', '/', 'U', 0, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csspevX( 'N', 'A', '/', 0, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         INFOT = 4
         CALL csspevX( 'N', 'A', 'U', -1, A, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csspevX( 'N', 'V', 'U', 1, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL csspevX( 'N', 'I', 'U', 1, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL csspevX( 'N', 'I', 'U', 1, A, 0.0, 0.0, 2, 1, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL csspevX( 'N', 'I', 'U', 2, A, 0.0, 0.0, 2, 1, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL csspevX( 'N', 'I', 'U', 1, A, 0.0, 0.0, 1, 2, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL csspevX( 'V', 'A', 'U', 2, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, IW, I3, INFO )
         CALL CHKXER( 'csspevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*     Test error exits for the SB path.
*
      ELSE IF( LSAMEN( 2, C2, 'SB' ) ) THEN
*
*        cssbtrd
*
         SRNAMT = 'cssbtrd'
         INFOT = 1
         CALL cssbtrd( '/', 'U', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssbtrd( 'N', '/', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssbtrd( 'N', 'U', -1, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssbtrd( 'N', 'U', 0, -1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cssbtrd( 'N', 'U', 1, 1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssbtrd( 'V', 'U', 2, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cssbtrd', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cssbevD
*
         SRNAMT = 'cssbevD'
         INFOT = 1
        CALL cssbevD( '/', 'U', 0, 0, A, 1, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cssbevD( 'N', '/', 0, 0, A, 1, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssbevD( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssbevD( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cssbevD( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, 4, IW, 1, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cssbevD( 'V', 'U', 2, 1, A, 2, X, Z, 1, W, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cssbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cssbevD( 'N', 'U', 2, 0, A, 1, X, Z, 1, W, 3, IW, 1, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cssbevD( 'V', 'U', 2, 0, A, 1, X, Z, 2, W, 18, IW, 12,
     $                INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cssbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cssbevD( 'V', 'U', 2, 0, A, 1, X, Z, 2, W, 25, IW, 11,
     $                INFO )
         CALL CHKXER( 'cssbevD', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cssbev
*
         SRNAMT = 'cssbev '
         INFOT = 1
         CALL cssbev( '/', 'U', 0, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssbev( 'N', '/', 0, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssbev( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssbev( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cssbev( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cssbev( 'V', 'U', 2, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cssbev ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cssbevX
*
         SRNAMT = 'cssbevX'
         INFOT = 1
         CALL cssbevX( '/', 'A', 'U', 0, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssbevX( 'N', '/', 'U', 0, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssbevX( 'N', 'A', '/', 0, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         INFOT = 4
         CALL cssbevX( 'N', 'A', 'U', -1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cssbevX( 'N', 'A', 'U', 0, -1, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cssbevX( 'N', 'A', 'U', 2, 1, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cssbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 2, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cssbevX( 'N', 'V', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cssbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cssbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 2, 1,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cssbevX( 'N', 'I', 'U', 2, 0, A, 1, Q, 1, 0.0, 0.0, 2, 1,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cssbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 1, 2,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cssbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 2, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cssbevX', INFOT, NOUT, LERR, OK )
         NT = NT + 13
      END IF
*
*     Print a summary line.
*
      IF( OK ) THEN
         WRITE( NOUT, FMT = 9999 )PATH, NT
      ELSE
         WRITE( NOUT, FMT = 9998 )PATH
      END IF
*
 9999 FORMAT( 1X, A3, ' routines passed the tests of the error exits',
     $      ' (', I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of SERRST
*
      END
