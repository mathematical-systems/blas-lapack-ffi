      SUBROUTINE CERRST( PATH, NUNIT )
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
*  CERRST tests the error exits for cchetrd, ccungtr, ccunmtr, cchptrd,
*  ccungtr, ccupmtr, ccsteqr, ccstein, ccpteqr, cchbtrd,
*  ccheev, ccheevX, ccheevD, cchbev, cchbevX, cchbevD,
*  cchpev, cchpevX, cchpevD, and ccstedc.
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
      INTEGER            NMAX, LIW, LW
      PARAMETER          ( NMAX = 3, LIW = 12*NMAX, LW = 20*NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J, M, N, NT
*     ..
*     .. Local Arrays ..
      INTEGER            I1( NMAX ), I2( NMAX ), I3( NMAX ), IW( LIW )
      REAL               D( NMAX ), E( NMAX ), R( LW ), RW( LW ),
     $                   X( NMAX )
      COMPLEX            A( NMAX, NMAX ), C( NMAX, NMAX ),
     $                   Q( NMAX, NMAX ), TAU( NMAX ), W( LW ),
     $                   Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       cchbev, cchbevD, cchbevX, cchbtrd, ccheev, ccheevD,
     $               ccheevR, ccheevX, cchetrd, CHKXER, cchpev, cchpevD,
     $             cchpevX, cchptrd, ccpteqr, ccstedc, ccstein, ccsteqr,
     $                   ccungtr, ccunmtr, ccupgtr, ccupmtr
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
*        cchetrd
*
         SRNAMT = 'cchetrd'
         INFOT = 1
         CALL cchetrd( '/', 0, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cchetrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchetrd( 'U', -1, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cchetrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchetrd( 'U', 2, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'cchetrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchetrd( 'U', 0, A, 1, D, E, TAU, W, 0, INFO )
         CALL CHKXER( 'cchetrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        ccungtr
*
         SRNAMT = 'ccungtr'
         INFOT = 1
         CALL ccungtr( '/', 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccungtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccungtr( 'U', -1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccungtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccungtr( 'U', 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccungtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccungtr( 'U', 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'ccungtr', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        ccunmtr
*
         SRNAMT = 'ccunmtr'
         INFOT = 1
         CALL ccunmtr('/', 'U', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccunmtr('L', '/', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccunmtr('L', 'U', '/', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccunmtr( 'L', 'U', 'N', -1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmtr( 'L', 'U', 'N', 0, -1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccunmtr('L', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccunmtr('R', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccunmtr('L', 'U', 'N', 2, 0, A, 2, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccunmtr('L', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccunmtr('R', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'ccunmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cchptrd
*
         SRNAMT = 'cchptrd'
         INFOT = 1
         CALL cchptrd( '/', 0, A, D, E, TAU, INFO )
         CALL CHKXER( 'cchptrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchptrd( 'U', -1, A, D, E, TAU, INFO )
         CALL CHKXER( 'cchptrd', INFOT, NOUT, LERR, OK )
         NT = NT + 2
*
*        ccupgtr
*
         SRNAMT = 'ccupgtr'
         INFOT = 1
         CALL ccupgtr( '/', 0, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'ccupgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccupgtr( 'U', -1, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'ccupgtr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccupgtr( 'U', 2, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'ccupgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        ccupmtr
*
         SRNAMT = 'ccupmtr'
         INFOT = 1
         CALL ccupmtr( '/', 'U', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccupmtr( 'L', '/', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccupmtr( 'L', 'U', '/', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccupmtr( 'L', 'U', 'N', -1, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccupmtr( 'L', 'U', 'N', 0, -1, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccupmtr( 'L', 'U', 'N', 2, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'ccupmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        ccpteqr
*
         SRNAMT = 'ccpteqr'
         INFOT = 1
         CALL ccpteqr( '/', 0, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpteqr( 'N', -1, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpteqr( 'V', 2, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccpteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        ccstein
*
         SRNAMT = 'ccstein'
         INFOT = 1
         CALL ccstein( -1, D, E, 0, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccstein( 0, D, E, -1, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccstein( 0, D, E, 1, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccstein', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccstein( 2, D, E, 0, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccstein', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        ccsteqr
*
         SRNAMT = 'ccsteqr'
         INFOT = 1
         CALL ccsteqr( '/', 0, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsteqr( 'N', -1, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccsteqr( 'V', 2, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'ccsteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        ccstedc
*
         SRNAMT = 'ccstedc'
         INFOT = 1
         CALL ccstedc( '/', 0, D, E, Z, 1, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccstedc( 'N', -1, D, E, Z, 1, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccstedc( 'V', 2, D, E, Z, 1, W, 4, RW, 23, IW, 28, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccstedc( 'N', 2, D, E, Z, 1, W, 0, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccstedc( 'V', 2, D, E, Z, 2, W, 0, RW, 23, IW, 28, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccstedc( 'N', 2, D, E, Z, 1, W, 1, RW, 0, IW, 1, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccstedc( 'I', 2, D, E, Z, 2, W, 1, RW, 1, IW, 12, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccstedc( 'V', 2, D, E, Z, 2, W, 4, RW, 1, IW, 28, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccstedc( 'N', 2, D, E, Z, 1, W, 1, RW, 1, IW, 0, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccstedc( 'I', 2, D, E, Z, 2, W, 1, RW, 23, IW, 0, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccstedc( 'V', 2, D, E, Z, 2, W, 4, RW, 23, IW, 0, INFO )
         CALL CHKXER( 'ccstedc', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        ccheevD
*
         SRNAMT = 'ccheevD'
         INFOT = 1
         CALL ccheevD( '/', 'U', 0, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccheevD( 'N', '/', 0, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccheevD( 'N', 'U', -1, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccheevD( 'N', 'U', 2, A, 1, X, W, 3, RW, 2, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheevD( 'N', 'U', 1, A, 1, X, W, 0, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheevD( 'N', 'U', 2, A, 2, X, W, 2, RW, 2, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheevD('V', 'U', 2, A, 2, X, W, 3, RW, 25, IW, 12, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccheevD( 'N', 'U', 1, A, 1, X, W, 1, RW, 0, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccheevD( 'N', 'U', 2, A, 2, X, W, 3, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccheevD('V', 'U', 2, A, 2, X, W, 8, RW, 18, IW, 12, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccheevD( 'N', 'U', 1, A, 1, X, W, 1, RW, 1, IW, 0, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccheevD('V', 'U', 2, A, 2, X, W, 8, RW, 25, IW, 11, INFO )
         CALL CHKXER( 'ccheevD', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        ccheev
*
         SRNAMT = 'ccheev '
         INFOT = 1
         CALL ccheev( '/', 'U', 0, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'ccheev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccheev( 'N', '/', 0, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'ccheev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccheev( 'N', 'U', -1, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'ccheev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccheev( 'N', 'U', 2, A, 1, X, W, 3, RW, INFO )
         CALL CHKXER( 'ccheev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheev( 'N', 'U', 2, A, 2, X, W, 2, RW, INFO )
         CALL CHKXER( 'ccheev ', INFOT, NOUT, LERR, OK )
         NT = NT + 5
*
*        ccheevX
*
         SRNAMT = 'ccheevX'
         INFOT = 1
         CALL ccheevX('/', 'A', 'U', 0, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccheevX('V', '/', 'U', 0, A, 1, 0.0, 1.0, 1, 0, 0.0, M, X,
     $                Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccheevX('V', 'A', '/', 0, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, RW, IW, I3, INFO )
         INFOT = 4
         CALL ccheevX( 'V', 'A', 'U', -1, A, 1, 0.0, 0.0, 0, 0, 0.0, M,
     $                X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccheevX('V', 'A', 'U', 2, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 2, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheevX('V', 'V', 'U', 1, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccheevX('V', 'I', 'U', 1, A, 1, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccheevX('V', 'I', 'U', 2, A, 2, 0.0, 0.0, 2, 1, 0.0, M, X,
     $                Z, 2, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL ccheevX('V', 'A', 'U', 2, A, 2, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL ccheevX('V', 'A', 'U', 2, A, 2, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 2, W, 2, RW, IW, I1, INFO )
         CALL CHKXER( 'ccheevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        ccheevR
*
         SRNAMT = 'ccheevR'
         N = 1
         INFOT = 1
         CALL ccheevR('/', 'A', 'U', 0, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccheevR('V', '/', 'U', 0, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccheevR( 'V', 'A', '/', -1, A, 1, 0.0, 0.0, 1, 1, 0.0, M,
     $                R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccheevR( 'V', 'A', 'U', -1, A, 1, 0.0, 0.0, 1, 1, 0.0, M,
     $                R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccheevR('V', 'A', 'U', 2, A, 1, 0.0, 0.0, 1, 1, 0.0, M, R,
     $                Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ), 10*N,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccheevR( 'V', 'V', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccheevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 0, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 10
*
         CALL ccheevR( 'V', 'I', 'U', 2, A, 2, 0.0E0, 0.0E0, 2, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL ccheevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 0, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL ccheevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N-1, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL ccheevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N-1, IW( 2*N-1 ),
     $                10*N, INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL ccheevR( 'V', 'I', 'U', 1, A, 1, 0.0E0, 0.0E0, 1, 1, 0.0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW, 10*N-1,
     $                INFO )
         CALL CHKXER( 'ccheevR', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cchpevD
*
         SRNAMT = 'cchpevD'
         INFOT = 1
         CALL cchpevD( '/', 'U', 0, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpevD( 'N', '/', 0, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchpevD( 'N', 'U', -1, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchpevD( 'V', 'U', 2, A, X, Z, 1, W, 4, RW, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchpevD( 'N', 'U', 1, A, X, Z, 1, W, 0, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchpevD( 'N', 'U', 2, A, X, Z, 2, W, 1, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchpevD( 'V', 'U', 2, A, X, Z, 2, W, 2, RW, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchpevD( 'N', 'U', 1, A, X, Z, 1, W, 1, RW, 0, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchpevD( 'N', 'U', 2, A, X, Z, 2, W, 2, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchpevD( 'V', 'U', 2, A, X, Z, 2, W, 4, RW, 18, IW, 12,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchpevD( 'N', 'U', 1, A, X, Z, 1, W, 1, RW, 1, IW, 0,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchpevD( 'N', 'U', 2, A, X, Z, 2, W, 2, RW, 2, IW, 0,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchpevD( 'V', 'U', 2, A, X, Z, 2, W, 4, RW, 25, IW, 2,
     $                INFO )
         CALL CHKXER( 'cchpevD', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        cchpev
*
         SRNAMT = 'cchpev '
         INFOT = 1
         CALL cchpev( '/', 'U', 0, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchpev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpev( 'N', '/', 0, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchpev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchpev( 'N', 'U', -1, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchpev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchpev( 'V', 'U', 2, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchpev ', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cchpevX
*
         SRNAMT = 'cchpevX'
         INFOT = 1
         CALL cchpevX('/', 'A', 'U', 0, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpevX('V', '/', 'U', 0, A, 0.0, 1.0, 1, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchpevX('V', 'A', '/', 0, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchpevX( 'V', 'A', 'U', -1, A, 0.0, 0.0, 0, 0, 0.0, M, X,
     $                Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchpevX('V', 'V', 'U', 1, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cchpevX('V', 'I', 'U', 1, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchpevX('V', 'I', 'U', 2, A, 0.0, 0.0, 2, 1, 0.0, M, X, Z,
     $                2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cchpevX('V', 'A', 'U', 2, A, 0.0, 0.0, 0, 0, 0.0, M, X, Z,
     $                1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchpevX', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the HB path.
*
      ELSE IF( LSAMEN( 2, C2, 'HB' ) ) THEN
*
*        cchbtrd
*
         SRNAMT = 'cchbtrd'
         INFOT = 1
         CALL cchbtrd( '/', 'U', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchbtrd( 'N', '/', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchbtrd( 'N', 'U', -1, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchbtrd( 'N', 'U', 0, -1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cchbtrd( 'N', 'U', 1, 1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cchbtrd( 'V', 'U', 2, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'cchbtrd', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cchbevD
*
         SRNAMT = 'cchbevD'
         INFOT = 1
         CALL cchbevD('/', 'U', 0, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchbevD('N', '/', 0, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchbevD( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW,
     $                1, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchbevD( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, 1, RW, 1, IW,
     $                1, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cchbevD('N', 'U', 2, 1, A, 1, X, Z, 1, W, 2, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchbevD( 'V', 'U', 2, 1, A, 2, X, Z, 1, W, 8, RW, 25, IW,
     $                12, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchbevD('N', 'U', 1, 0, A, 1, X, Z, 1, W, 0, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchbevD('N', 'U', 2, 1, A, 2, X, Z, 2, W, 1, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 25, IW,
     $                12, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchbevD('N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, RW, 0, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchbevD('N', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 8, RW, 2, IW,
     $                12, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cchbevD('N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 0,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cchbevD('N', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 2, IW, 0,
     $                INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cchbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 8, RW, 25, IW,
     $                2, INFO )
         CALL CHKXER( 'cchbevD', INFOT, NOUT, LERR, OK )
         NT = NT + 15
*
*        cchbev
*
         SRNAMT = 'cchbev '
         INFOT = 1
         CALL cchbev( '/', 'U', 0, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchbev( 'N', '/', 0, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchbev( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchbev( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cchbev( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchbev( 'V', 'U', 2, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'cchbev ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cchbevX
*
         SRNAMT = 'cchbevX'
         INFOT = 1
         CALL cchbevX( '/', 'A', 'U', 0, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchbevX( 'V', '/', 'U', 0, 0, A, 1, Q, 1, 0.0, 1.0, 1, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchbevX( 'V', 'A', '/', 0, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         INFOT = 4
         CALL cchbevX( 'V', 'A', 'U', -1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchbevX( 'V', 'A', 'U', 0, -1, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchbevX( 'V', 'A', 'U', 2, 1, A, 1, Q, 2, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cchbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cchbevX( 'V', 'V', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cchbevX( 'V', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchbevX( 'V', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0, 0.0, 1, 2,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cchbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 2, 0.0, 0.0, 0, 0,
     $                0.0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'cchbevX', INFOT, NOUT, LERR, OK )
         NT = NT + 11
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
*     End of CERRST
*
      END
