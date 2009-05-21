      SUBROUTINE DERRST( PATH, NUNIT )
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
*  DERRST tests the error exits for cdsytrd, cdorgtr, cdormtr, cdsptrd,
*  cdopgtr, cdopmtr, cdsteqr, cssterf, csstebz, csstein, cdpteqr, cdsbtrd,
*  cdsyev, cssyevX, cssyevD, cdsbev, cssbevX, cssbevD,
*  cdspev, csspevX, csspevD, cdstev, csstevX, csstevD, and csstedc.
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
      DOUBLE PRECISION   A( NMAX, NMAX ), C( NMAX, NMAX ), D( NMAX ),
     $                   E( NMAX ), Q( NMAX, NMAX ), R( NMAX ),
     $                   TAU( NMAX ), W( LW ), X( NMAX ),
     $                   Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, cdopgtr, cdopmtr, cdorgtr, cdormtr, cdpteqr,
     $               cdsbev, cdsbevD, cdsbevX, cdsbtrd, cdspev, cdspevD,
     $             cdspevX, cdsptrd, cdstebz, cdstedc, cdstein, cdsteqr,
     $               cdsterf, cdstev, cdstevD, cdstevR, cdstevX, cdsyev,
     $                   cdsyevD, cdsyevR, cdsyevX, cdsytrd
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
      INTRINSIC          DBLE
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
            A( I, J ) = 1.D0 / DBLE( I+J )
   10    CONTINUE
   20 CONTINUE
      DO 30 J = 1, NMAX
         D( J ) = DBLE( J )
         E( J ) = 0.0D0
         I1( J ) = J
         I2( J ) = J
         TAU( J ) = 1.D0
   30 CONTINUE
      OK = .TRUE.
      NT = 0
*
*     Test error exits for the ST path.
*
      IF( LSAMEN( 2, C2, 'ST' ) ) THEN
*
*        cdsytrd
*
         SRNAMT = 'cdsytrd'
         INFOT = 1
         CALL cdsytrd( '/', 0, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cdsytrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsytrd( 'U', -1, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cdsytrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdsytrd( 'U', 2, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cdsytrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdsytrd( 'U', 0, A, 1, D, E, TAU, W, 0, INFO )
         CALL CHKXER( 'cdsytrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cdorgtr
*
         SRNAMT = 'cdorgtr'
         INFOT = 1
         CALL cdorgtr( '/', 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdorgtr( 'U', -1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdorgtr( 'U', 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorgtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdorgtr( 'U', 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cdormtr
*
         SRNAMT = 'cdormtr'
         INFOT = 1
        CALL cdormtr( '/', 'U', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdormtr( 'L', '/', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdormtr( 'L', 'U', '/', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdormtr( 'L', 'U', 'N', -1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormtr( 'L', 'U', 'N', 0, -1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdormtr( 'L', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdormtr( 'R', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cdormtr( 'L', 'U', 'N', 2, 0, A, 2, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cdormtr( 'L', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cdormtr( 'R', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'cdormtr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdsptrd
*
         SRNAMT = 'cdsptrd'
         INFOT = 1
         CALL cdsptrd( '/', 0, A, D, E, TAU, INFO )
         CALL CHKXER( 'cdsptrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsptrd( 'U', -1, A, D, E, TAU, INFO )
         CALL CHKXER( 'cdsptrd', INFOT, NOUT, LERR, OK )
         NT = NT + 2
*
*        cdopgtr
*
         SRNAMT = 'cdopgtr'
         INFOT = 1
         CALL cdopgtr( '/', 0, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'cdopgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdopgtr( 'U', -1, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'cdopgtr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdopgtr( 'U', 2, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'cdopgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdopmtr
*
         SRNAMT = 'cdopmtr'
         INFOT = 1
         CALL cdopmtr( '/', 'U', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdopmtr( 'L', '/', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdopmtr( 'L', 'U', '/', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdopmtr( 'L', 'U', 'N', -1, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdopmtr( 'L', 'U', 'N', 0, -1, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdopmtr( 'L', 'U', 'N', 2, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'cdopmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cdpteqr
*
         SRNAMT = 'cdpteqr'
         INFOT = 1
         CALL cdpteqr( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdpteqr( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdpteqr( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdpteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdstebz
*
         SRNAMT = 'cdstebz'
         INFOT = 1
         CALL cdstebz( '/', 'E', 0, 0.0D0, 1.0D0, 1, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstebz( 'A', '/', 0, 0.0D0, 0.0D0, 0, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdstebz( 'A', 'E', -1, 0.0D0, 0.0D0, 0, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdstebz( 'V', 'E', 0, 0.0D0, 0.0D0, 0, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdstebz( 'I', 'E', 0, 0.0D0, 0.0D0, 0, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdstebz( 'I', 'E', 1, 0.0D0, 0.0D0, 2, 1, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdstebz( 'I', 'E', 1, 0.0D0, 0.0D0, 1, 0, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdstebz( 'I', 'E', 1, 0.0D0, 0.0D0, 1, 2, 0.0D0, D, E, M,
     $                NSPLIT, X, I1, I2, W, IW, INFO )
         CALL CHKXER( 'cdstebz', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cdstein
*
         SRNAMT = 'cdstein'
         INFOT = 1
         CALL cdstein( -1, D, E, 0, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdstein( 0, D, E, -1, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdstein( 0, D, E, 1, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstein', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdstein( 2, D, E, 0, X, I1, I2, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstein', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cdsteqr
*
         SRNAMT = 'cdsteqr'
         INFOT = 1
         CALL cdsteqr( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsteqr( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdsteqr( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdsterf
*
         SRNAMT = 'cdsterf'
         INFOT = 1
         CALL cdsterf( -1, D, E, INFO )
         CALL CHKXER( 'cdsterf', INFOT, NOUT, LERR, OK )
         NT = NT + 1
*
*        cdstedc
*
         SRNAMT = 'cdstedc'
         INFOT = 1
         CALL cdstedc( '/', 0, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstedc( 'N', -1, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdstedc( 'V', 2, D, E, Z, 1, W, 23, IW, 28, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstedc( 'N', 1, D, E, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstedc( 'I', 2, D, E, Z, 2, W, 0, IW, 12, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstedc( 'V', 2, D, E, Z, 2, W, 0, IW, 28, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdstedc( 'N', 1, D, E, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdstedc( 'I', 2, D, E, Z, 2, W, 19, IW, 0, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdstedc( 'V', 2, D, E, Z, 2, W, 23, IW, 0, INFO )
         CALL CHKXER( 'cdstedc', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdstevD
*
         SRNAMT = 'cdstevD'
         INFOT = 1
         CALL cdstevD( '/', 0, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstevD( 'N', -1, D, E, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdstevD( 'V', 2, D, E, Z, 1, W, 19, IW, 12, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstevD( 'N', 1, D, E, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstevD( 'V', 2, D, E, Z, 2, W, 12, IW, 12, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdstevD( 'N', 0, D, E, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdstevD( 'V', 2, D, E, Z, 2, W, 19, IW, 11, INFO )
         CALL CHKXER( 'cdstevD', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        cdstev
*
         SRNAMT = 'cdstev '
         INFOT = 1
         CALL cdstev( '/', 0, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdstev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstev( 'N', -1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdstev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdstev( 'V', 2, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdstev ', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdstevX
*
         SRNAMT = 'cdstevX'
         INFOT = 1
         CALL cdstevX( '/', 'A', 0, D, E, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstevX( 'N', '/', 0, D, E, 0.0D0, 1.0D0, 1, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdstevX( 'N', 'A', -1, D, E, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdstevX( 'N', 'V', 1, D, E, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstevX( 'N', 'I', 1, D, E, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstevX( 'N', 'I', 1, D, E, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdstevX( 'N', 'I', 2, D, E, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdstevX( 'N', 'I', 1, D, E, 0.0D0, 0.0D0, 1, 2, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cdstevX( 'V', 'A', 2, D, E, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdstevX', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdstevR
*
         N = 1
         SRNAMT = 'cdstevR'
         INFOT = 1
         CALL cdstevR( '/', 'A', 0, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                R, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdstevR( 'V', '/', 0, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                R, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdstevR( 'V', 'A', -1, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                R, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdstevR( 'V', 'V', 1, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                R, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdstevR( 'V', 'I', 1, D, E, 0.0D0, 0.0D0, 0, 1, 0.0D0, M,
     $                W, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
         N = 2
         CALL cdstevR( 'V', 'I', 2, D, E, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                W, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 14
         N = 1
         CALL cdstevR( 'V', 'I', 1, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                W, Z, 0, IW, X, 20*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL cdstevR( 'V', 'I', 1, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                W, Z, 1, IW, X, 20*N-1, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         INFOT = 19
         CALL cdstevR( 'V', 'I', 1, D, E, 0.0D0, 0.0D0, 1, 1, 0.0D0, M,
     $                W, Z, 1, IW, X, 20*N, IW( 2*N+1 ), 10*N-1, INFO )
         CALL CHKXER( 'cdstevR', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdsyevD
*
         SRNAMT = 'cdsyevD'
         INFOT = 1
         CALL cdsyevD( '/', 'U', 0, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsyevD( 'N', '/', 0, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsyevD( 'N', 'U', -1, A, 1, X, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdsyevD( 'N', 'U', 2, A, 1, X, W, 3, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdsyevD( 'N', 'U', 1, A, 1, X, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdsyevD( 'N', 'U', 2, A, 2, X, W, 4, IW, 1, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdsyevD( 'V', 'U', 2, A, 2, X, W, 20, IW, 12, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdsyevD( 'N', 'U', 1, A, 1, X, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdsyevD( 'N', 'U', 2, A, 2, X, W, 5, IW, 0, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdsyevD( 'V', 'U', 2, A, 2, X, W, 27, IW, 11, INFO )
         CALL CHKXER( 'cdsyevD', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdsyevR
*
         SRNAMT = 'cdsyevR'
         N = 1
         INFOT = 1
        CALL cdsyevR( '/', 'A', 'U', 0, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdsyevR( 'V', '/', 'U', 0, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsyevR( 'V', 'A', '/', -1, A, 1, 0.0D0, 0.0D0, 1, 1,
     $                0.0D0, M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdsyevR( 'V', 'A', 'U', -1, A, 1, 0.0D0, 0.0D0, 1, 1,
     $                0.0D0, M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdsyevR( 'V', 'A', 'U', 2, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdsyevR( 'V', 'V', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdsyevR( 'V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 10
*
        CALL cdsyevR( 'V', 'I', 'U', 2, A, 2, 0.0D0, 0.0D0, 2, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cdsyevR( 'V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 0, IW, Q, 26*N, IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 18
        CALL cdsyevR( 'V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N-1, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         INFOT = 20
        CALL cdsyevR( 'V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 26*N, IW( 2*N+1 ), 10*N-1,
     $                INFO )
         CALL CHKXER( 'cdsyevR', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cdsyev
*
         SRNAMT = 'cdsyev '
         INFOT = 1
         CALL cdsyev( '/', 'U', 0, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cdsyev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsyev( 'N', '/', 0, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cdsyev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsyev( 'N', 'U', -1, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cdsyev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdsyev( 'N', 'U', 2, A, 1, X, W, 3, INFO )
         CALL CHKXER( 'cdsyev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdsyev( 'N', 'U', 1, A, 1, X, W, 1, INFO )
         CALL CHKXER( 'cdsyev ', INFOT, NOUT, LERR, OK )
         NT = NT + 5
*
*        cdsyevX
*
         SRNAMT = 'cdsyevX'
         INFOT = 1
        CALL cdsyevX( '/', 'A', 'U', 0, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdsyevX( 'N', '/', 'U', 0, A, 1, 0.0D0, 1.0D0, 1, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdsyevX( 'N', 'A', '/', 0, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, IW, I3, INFO )
         INFOT = 4
         CALL cdsyevX( 'N', 'A', 'U', -1, A, 1, 0.0D0, 0.0D0, 0, 0,
     $                0.0D0, M, X, Z, 1, W, 1, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdsyevX( 'N', 'A', 'U', 2, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdsyevX( 'N', 'V', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdsyevX( 'N', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdsyevX( 'N', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 2, 1, 0.0D0,
     $                M, X, Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cdsyevX( 'N', 'I', 'U', 2, A, 2, 0.0D0, 0.0D0, 2, 1, 0.0D0,
     $                M, X, Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cdsyevX( 'N', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 2, 0.0D0,
     $                M, X, Z, 1, W, 8, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cdsyevX( 'V', 'A', 'U', 2, A, 2, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 16, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cdsyevX( 'V', 'A', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 0, IW, I3, INFO )
         CALL CHKXER( 'cdsyevX', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cdspevD
*
         SRNAMT = 'cdspevD'
         INFOT = 1
         CALL cdspevD( '/', 'U', 0, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdspevD( 'N', '/', 0, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdspevD( 'N', 'U', -1, A, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdspevD( 'V', 'U', 2, A, X, Z, 1, W, 23, IW, 12, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdspevD( 'N', 'U', 1, A, X, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdspevD( 'N', 'U', 2, A, X, Z, 1, W, 3, IW, 1, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdspevD( 'V', 'U', 2, A, X, Z, 2, W, 16, IW, 12, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdspevD( 'N', 'U', 1, A, X, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdspevD( 'N', 'U', 2, A, X, Z, 1, W, 4, IW, 0, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdspevD( 'V', 'U', 2, A, X, Z, 2, W, 23, IW, 11, INFO )
         CALL CHKXER( 'cdspevD', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdspev
*
         SRNAMT = 'cdspev '
         INFOT = 1
         CALL cdspev( '/', 'U', 0, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'cdspev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdspev( 'N', '/', 0, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'cdspev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdspev( 'N', 'U', -1, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'cdspev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdspev( 'V', 'U', 2, A, W, Z, 1, X, INFO )
         CALL CHKXER( 'cdspev ', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cdspevX
*
         SRNAMT = 'cdspevX'
         INFOT = 1
        CALL cdspevX( '/', 'A', 'U', 0, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdspevX( 'N', '/', 'U', 0, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdspevX( 'N', 'A', '/', 0, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         INFOT = 4
         CALL cdspevX( 'N', 'A', 'U', -1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdspevX( 'N', 'V', 'U', 1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdspevX( 'N', 'I', 'U', 1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdspevX( 'N', 'I', 'U', 1, A, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdspevX( 'N', 'I', 'U', 2, A, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdspevX( 'N', 'I', 'U', 1, A, 0.0D0, 0.0D0, 1, 2, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cdspevX( 'V', 'A', 'U', 2, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdspevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*     Test error exits for the SB path.
*
      ELSE IF( LSAMEN( 2, C2, 'SB' ) ) THEN
*
*        cdsbtrd
*
         SRNAMT = 'cdsbtrd'
         INFOT = 1
         CALL cdsbtrd( '/', 'U', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsbtrd( 'N', '/', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsbtrd( 'N', 'U', -1, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdsbtrd( 'N', 'U', 0, -1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdsbtrd( 'N', 'U', 1, 1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdsbtrd( 'V', 'U', 2, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbtrd', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cdsbevD
*
         SRNAMT = 'cdsbevD'
         INFOT = 1
        CALL cdsbevD( '/', 'U', 0, 0, A, 1, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdsbevD( 'N', '/', 0, 0, A, 1, X, Z, 1, W, 1, IW, 1, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsbevD( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdsbevD( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdsbevD( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, 4, IW, 1, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdsbevD( 'V', 'U', 2, 1, A, 2, X, Z, 1, W, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdsbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 0, IW, 1, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdsbevD( 'N', 'U', 2, 0, A, 1, X, Z, 1, W, 3, IW, 1, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdsbevD( 'V', 'U', 2, 0, A, 1, X, Z, 2, W, 18, IW, 12,
     $                INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cdsbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, IW, 0, INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdsbevD( 'V', 'U', 2, 0, A, 1, X, Z, 2, W, 25, IW, 11,
     $                INFO )
         CALL CHKXER( 'cdsbevD', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cdsbev
*
         SRNAMT = 'cdsbev '
         INFOT = 1
         CALL cdsbev( '/', 'U', 0, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsbev( 'N', '/', 0, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsbev( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdsbev( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdsbev( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdsbev( 'V', 'U', 2, 0, A, 1, X, Z, 1, W, INFO )
         CALL CHKXER( 'cdsbev ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cdsbevX
*
         SRNAMT = 'cdsbevX'
         INFOT = 1
         CALL cdsbevX( '/', 'A', 'U', 0, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdsbevX( 'N', '/', 'U', 0, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdsbevX( 'N', 'A', '/', 0, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         INFOT = 4
        CALL cdsbevX( 'N', 'A', 'U', -1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cdsbevX( 'N', 'A', 'U', 0, -1, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdsbevX( 'N', 'A', 'U', 2, 1, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdsbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 2, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdsbevX( 'N', 'V', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdsbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdsbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 2,
     $                1, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdsbevX( 'N', 'I', 'U', 2, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 2,
     $                1, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdsbevX( 'N', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 1,
     $                2, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdsbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 2, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, IW, I3, INFO )
         CALL CHKXER( 'cdsbevX', INFOT, NOUT, LERR, OK )
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
*     End of DERRST
*
      END
