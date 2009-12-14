      SUBROUTINE ZERRST( PATH, NUNIT )
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
*  ZERRST tests the error exits for czhetrd, czungtr, ccunmtr, czhptrd,
*  czungtr, czupmtr, czsteqr, ccstein, czpteqr, czhbtrd,
*  czheev, ccheevX, ccheevD, czhbev, cchbevX, cchbevD,
*  czhpev, cchpevX, cchpevD, and czstedc.
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
      DOUBLE PRECISION   D( NMAX ), E( NMAX ), R( LW ), RW( LW ),
     $                   X( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), C( NMAX, NMAX ),
     $                   Q( NMAX, NMAX ), TAU( NMAX ), W( LW ),
     $                   Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, czhbev, czhbevD, czhbevX, czhbtrd, czheev,
     $              czheevD, czheevR, czheevX, czhetrd, czhpev, czhpevD,
     $             czhpevX, czhptrd, czpteqr, czstedc, czstein, czsteqr,
     $                   czungtr, czunmtr, czupgtr, czupmtr
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
*        czhetrd
*
         SRNAMT = 'czhetrd'
         INFOT = 1
         CALL czhetrd( '/', 0, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'czhetrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhetrd( 'U', -1, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'czhetrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhetrd( 'U', 2, A, 1, D, E, TAU, W, 1, INFO )
         CALL CHKXER( 'czhetrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhetrd( 'U', 0, A, 1, D, E, TAU, W, 0, INFO )
         CALL CHKXER( 'czhetrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        czungtr
*
         SRNAMT = 'czungtr'
         INFOT = 1
         CALL czungtr( '/', 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'czungtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czungtr( 'U', -1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'czungtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czungtr( 'U', 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'czungtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czungtr( 'U', 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'czungtr', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        czunmtr
*
         SRNAMT = 'czunmtr'
         INFOT = 1
        CALL czunmtr( '/', 'U', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czunmtr( 'L', '/', 'N', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czunmtr( 'L', 'U', '/', 0, 0, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czunmtr( 'L', 'U', 'N', -1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czunmtr( 'L', 'U', 'N', 0, -1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czunmtr( 'L', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
         CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czunmtr( 'R', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL czunmtr( 'L', 'U', 'N', 2, 0, A, 2, TAU, C, 1, W, 1, INFO )
         CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czunmtr( 'L', 'U', 'N', 0, 2, A, 1, TAU, C, 1, W, 1, INFO )
        CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czunmtr( 'R', 'U', 'N', 2, 0, A, 1, TAU, C, 2, W, 1, INFO )
        CALL CHKXER( 'czunmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        czhptrd
*
         SRNAMT = 'czhptrd'
         INFOT = 1
         CALL czhptrd( '/', 0, A, D, E, TAU, INFO )
         CALL CHKXER( 'czhptrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhptrd( 'U', -1, A, D, E, TAU, INFO )
         CALL CHKXER( 'czhptrd', INFOT, NOUT, LERR, OK )
         NT = NT + 2
*
*        czupgtr
*
         SRNAMT = 'czupgtr'
         INFOT = 1
         CALL czupgtr( '/', 0, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'czupgtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czupgtr( 'U', -1, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'czupgtr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czupgtr( 'U', 2, A, TAU, Z, 1, W, INFO )
         CALL CHKXER( 'czupgtr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        czupmtr
*
         SRNAMT = 'czupmtr'
         INFOT = 1
         CALL czupmtr( '/', 'U', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czupmtr( 'L', '/', 'N', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czupmtr( 'L', 'U', '/', 0, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czupmtr( 'L', 'U', 'N', -1, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czupmtr( 'L', 'U', 'N', 0, -1, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czupmtr( 'L', 'U', 'N', 2, 0, A, TAU, C, 1, W, INFO )
         CALL CHKXER( 'czupmtr', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        czpteqr
*
         SRNAMT = 'czpteqr'
         INFOT = 1
         CALL czpteqr( '/', 0, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpteqr( 'N', -1, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czpteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpteqr( 'V', 2, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czpteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        czstein
*
         SRNAMT = 'czstein'
         INFOT = 1
         CALL czstein( -1, D, E, 0, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czstein( 0, D, E, -1, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czstein', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czstein( 0, D, E, 1, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czstein', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czstein( 2, D, E, 0, X, I1, I2, Z, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czstein', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        czsteqr
*
         SRNAMT = 'czsteqr'
         INFOT = 1
         CALL czsteqr( '/', 0, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsteqr( 'N', -1, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czsteqr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czsteqr( 'V', 2, D, E, Z, 1, RW, INFO )
         CALL CHKXER( 'czsteqr', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        czstedc
*
         SRNAMT = 'czstedc'
         INFOT = 1
         CALL czstedc( '/', 0, D, E, Z, 1, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czstedc( 'N', -1, D, E, Z, 1, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czstedc( 'V', 2, D, E, Z, 1, W, 4, RW, 23, IW, 28, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czstedc( 'N', 2, D, E, Z, 1, W, 0, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czstedc( 'V', 2, D, E, Z, 2, W, 0, RW, 23, IW, 28, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czstedc( 'N', 2, D, E, Z, 1, W, 1, RW, 0, IW, 1, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czstedc( 'I', 2, D, E, Z, 2, W, 1, RW, 1, IW, 12, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czstedc( 'V', 2, D, E, Z, 2, W, 4, RW, 1, IW, 28, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czstedc( 'N', 2, D, E, Z, 1, W, 1, RW, 1, IW, 0, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czstedc( 'I', 2, D, E, Z, 2, W, 1, RW, 23, IW, 0, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czstedc( 'V', 2, D, E, Z, 2, W, 4, RW, 23, IW, 0, INFO )
         CALL CHKXER( 'czstedc', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        czheevD
*
         SRNAMT = 'czheevD'
         INFOT = 1
         CALL czheevD( '/', 'U', 0, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czheevD( 'N', '/', 0, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czheevD( 'N', 'U', -1, A, 1, X, W, 1, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czheevD( 'N', 'U', 2, A, 1, X, W, 3, RW, 2, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheevD( 'N', 'U', 1, A, 1, X, W, 0, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheevD( 'N', 'U', 2, A, 2, X, W, 2, RW, 2, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheevD('V', 'U', 2, A, 2, X, W, 3, RW, 25, IW, 12, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czheevD( 'N', 'U', 1, A, 1, X, W, 1, RW, 0, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czheevD( 'N', 'U', 2, A, 2, X, W, 3, RW, 1, IW, 1, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czheevD('V', 'U', 2, A, 2, X, W, 8, RW, 18, IW, 12, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czheevD( 'N', 'U', 1, A, 1, X, W, 1, RW, 1, IW, 0, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czheevD('V', 'U', 2, A, 2, X, W, 8, RW, 25, IW, 11, INFO )
         CALL CHKXER( 'czheevD', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        czheev
*
         SRNAMT = 'czheev '
         INFOT = 1
         CALL czheev( '/', 'U', 0, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'czheev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czheev( 'N', '/', 0, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'czheev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czheev( 'N', 'U', -1, A, 1, X, W, 1, RW, INFO )
         CALL CHKXER( 'czheev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czheev( 'N', 'U', 2, A, 1, X, W, 3, RW, INFO )
         CALL CHKXER( 'czheev ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheev( 'N', 'U', 2, A, 2, X, W, 2, RW, INFO )
         CALL CHKXER( 'czheev ', INFOT, NOUT, LERR, OK )
         NT = NT + 5
*
*        czheevX
*
         SRNAMT = 'czheevX'
         INFOT = 1
         CALL czheevX('/', 'A', 'U', 0, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czheevX('V', '/', 'U', 0, A, 1, 0.0D0, 1.0D0, 1, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czheevX('V', 'A', '/', 0, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         INFOT = 4
         CALL czheevX( 'V', 'A', 'U', -1, A, 1, 0.0D0, 0.0D0, 0, 0,
     $                0.0D0, M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czheevX('V', 'A', 'U', 2, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 2, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheevX('V', 'V', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czheevX('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 1, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czheevX('V', 'I', 'U', 2, A, 2, 0.0D0, 0.0D0, 2, 1, 0.0D0,
     $                M, X, Z, 2, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czheevX('V', 'A', 'U', 2, A, 2, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, 3, RW, IW, I3, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL czheevX('V', 'A', 'U', 2, A, 2, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 2, W, 2, RW, IW, I1, INFO )
         CALL CHKXER( 'czheevX', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        czheevR
*
         SRNAMT = 'czheevR'
         N = 1
         INFOT = 1
         CALL czheevR('/', 'A', 'U', 0, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czheevR('V', '/', 'U', 0, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czheevR( 'V', 'A', '/', -1, A, 1, 0.0D0, 0.0D0, 1, 1,
     $                0.0D0, M, R, Z, 1, IW, Q, 2*N, RW, 24*N,
     $                IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czheevR( 'V', 'A', 'U', -1, A, 1, 0.0D0, 0.0D0, 1, 1,
     $                0.0D0, M, R, Z, 1, IW, Q, 2*N, RW, 24*N,
     $                IW( 2*N+1 ), 10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czheevR('V', 'A', 'U', 2, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czheevR('V', 'V', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czheevR('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 0, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 10
*
         CALL czheevR('V', 'I', 'U', 2, A, 2, 0.0D0, 0.0D0, 2, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czheevR('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 0, IW, Q, 2*N, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czheevR('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N-1, RW, 24*N, IW( 2*N+1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL czheevR('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N-1, IW( 2*N-1 ),
     $                10*N, INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL czheevR('V', 'I', 'U', 1, A, 1, 0.0D0, 0.0D0, 1, 1, 0.0D0,
     $                M, R, Z, 1, IW, Q, 2*N, RW, 24*N, IW, 10*N-1,
     $                INFO )
         CALL CHKXER( 'czheevR', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        czhpevD
*
         SRNAMT = 'czhpevD'
         INFOT = 1
         CALL czhpevD( '/', 'U', 0, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpevD( 'N', '/', 0, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhpevD( 'N', 'U', -1, A, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhpevD( 'V', 'U', 2, A, X, Z, 1, W, 4, RW, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhpevD( 'N', 'U', 1, A, X, Z, 1, W, 0, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhpevD( 'N', 'U', 2, A, X, Z, 2, W, 1, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhpevD( 'V', 'U', 2, A, X, Z, 2, W, 2, RW, 25, IW, 12,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhpevD( 'N', 'U', 1, A, X, Z, 1, W, 1, RW, 0, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhpevD( 'N', 'U', 2, A, X, Z, 2, W, 2, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhpevD( 'V', 'U', 2, A, X, Z, 2, W, 4, RW, 18, IW, 12,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhpevD( 'N', 'U', 1, A, X, Z, 1, W, 1, RW, 1, IW, 0,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhpevD( 'N', 'U', 2, A, X, Z, 2, W, 2, RW, 2, IW, 0,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhpevD( 'V', 'U', 2, A, X, Z, 2, W, 4, RW, 25, IW, 2,
     $                INFO )
         CALL CHKXER( 'czhpevD', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        czhpev
*
         SRNAMT = 'czhpev '
         INFOT = 1
         CALL czhpev( '/', 'U', 0, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhpev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpev( 'N', '/', 0, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhpev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhpev( 'N', 'U', -1, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhpev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhpev( 'V', 'U', 2, A, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhpev ', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        czhpevX
*
         SRNAMT = 'czhpevX'
         INFOT = 1
         CALL czhpevX('/', 'A', 'U', 0, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpevX('V', '/', 'U', 0, A, 0.0D0, 1.0D0, 1, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhpevX('V', 'A', '/', 0, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhpevX( 'V', 'A', 'U', -1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0,
     $                M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhpevX('V', 'V', 'U', 1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhpevX('V', 'I', 'U', 1, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhpevX('V', 'I', 'U', 2, A, 0.0D0, 0.0D0, 2, 1, 0.0D0, M,
     $                X, Z, 2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czhpevX('V', 'A', 'U', 2, A, 0.0D0, 0.0D0, 0, 0, 0.0D0, M,
     $                X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhpevX', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the HB path.
*
      ELSE IF( LSAMEN( 2, C2, 'HB' ) ) THEN
*
*        czhbtrd
*
         SRNAMT = 'czhbtrd'
         INFOT = 1
         CALL czhbtrd( '/', 'U', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhbtrd( 'N', '/', 0, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhbtrd( 'N', 'U', -1, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhbtrd( 'N', 'U', 0, -1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czhbtrd( 'N', 'U', 1, 1, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czhbtrd( 'V', 'U', 2, 0, A, 1, D, E, Z, 1, W, INFO )
         CALL CHKXER( 'czhbtrd', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        czhbevD
*
         SRNAMT = 'czhbevD'
         INFOT = 1
        CALL czhbevD( '/', 'U', 0, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czhbevD( 'N', '/', 0, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhbevD( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW,
     $                1, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhbevD( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, 1, RW, 1, IW,
     $                1, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL czhbevD( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, 2, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhbevD( 'V', 'U', 2, 1, A, 2, X, Z, 1, W, 8, RW, 25, IW,
     $                12, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL czhbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 0, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL czhbevD( 'N', 'U', 2, 1, A, 2, X, Z, 2, W, 1, RW, 2, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 25, IW,
     $                12, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL czhbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, RW, 0, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL czhbevD( 'N', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 8, RW, 2, IW,
     $                12, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL czhbevD( 'N', 'U', 1, 0, A, 1, X, Z, 1, W, 1, RW, 1, IW, 0,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL czhbevD( 'N', 'U', 2, 1, A, 2, X, Z, 2, W, 2, RW, 2, IW, 0,
     $                INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czhbevD( 'V', 'U', 2, 1, A, 2, X, Z, 2, W, 8, RW, 25, IW,
     $                2, INFO )
         CALL CHKXER( 'czhbevD', INFOT, NOUT, LERR, OK )
         NT = NT + 15
*
*        czhbev
*
         SRNAMT = 'czhbev '
         INFOT = 1
         CALL czhbev( '/', 'U', 0, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhbev( 'N', '/', 0, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhbev( 'N', 'U', -1, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhbev( 'N', 'U', 0, -1, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czhbev( 'N', 'U', 2, 1, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhbev( 'V', 'U', 2, 0, A, 1, X, Z, 1, W, RW, INFO )
         CALL CHKXER( 'czhbev ', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        czhbevX
*
         SRNAMT = 'czhbevX'
         INFOT = 1
         CALL czhbevX( '/', 'A', 'U', 0, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhbevX( 'V', '/', 'U', 0, 0, A, 1, Q, 1, 0.0D0, 1.0D0, 1,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhbevX( 'V', 'A', '/', 0, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         INFOT = 4
        CALL czhbevX( 'V', 'A', 'U', -1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czhbevX( 'V', 'A', 'U', 0, -1, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhbevX( 'V', 'A', 'U', 2, 1, A, 1, Q, 2, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 2, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhbevX( 'V', 'V', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czhbevX( 'V', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhbevX( 'V', 'I', 'U', 1, 0, A, 1, Q, 1, 0.0D0, 0.0D0, 1,
     $                2, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czhbevX( 'V', 'A', 'U', 2, 0, A, 1, Q, 2, 0.0D0, 0.0D0, 0,
     $                0, 0.0D0, M, X, Z, 1, W, RW, IW, I3, INFO )
         CALL CHKXER( 'czhbevX', INFOT, NOUT, LERR, OK )
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
*     End of ZERRST
*
      END
