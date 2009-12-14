      SUBROUTINE ZERRGG( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 9, 2000
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  ZERRGG tests the error exits for czgges, czggesX, czggev, czggevX,
*  czggglm, czgghrd, czgglse, czggqrf, czggrqf, czggsvd, czggsvp, czhgeqz,
*  cztgevc, cztgexc, cztgsen, cztgsja, cztgsna, and cztgsyl.
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
      PARAMETER          ( NMAX = 3, LW = 6*NMAX )
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( ONE = 1.0D+0, ZERO = 0.0D+0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            DUMMYK, DUMMYL, I, IFST, ILST, INFO, J, M,
     $                   NCYCLE, NT, SDIM
      DOUBLE PRECISION   ANRM, BNRM, DIF, SCALE, TOLA, TOLB
      INTEGER            P1, P2
*     ..
*     .. Local Arrays ..
      LOGICAL            BW( NMAX ), SEL( NMAX )
      INTEGER            IW( LW )
      DOUBLE PRECISION   LS( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   RCE( NMAX ), RCV( NMAX ), RS( NMAX ), RW( LW )
      COMPLEX*16         A( NMAX, NMAX ), ALPHA( NMAX ),
     $                   B( NMAX, NMAX ), BETA( NMAX ), Q( NMAX, NMAX ),
     $                   TAU( NMAX ), U( NMAX, NMAX ), V( NMAX, NMAX ),
     $                   W( LW ), Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN, ZLCTES, ZLCTSX
      EXTERNAL           LSAMEN, ZLCTES, ZLCTSX
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, czgges, czggesX, czggev, czggevX, czggglm,
     $             czgghrd, czgglse, czggqrf, czggrqf, czggsvd, czggsvp,
     $             czhgeqz, cztgevc, cztgexc, cztgsen, cztgsja, cztgsna,
     $                   cztgsyl
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
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         SEL( J ) = .TRUE.
         DO 10 I = 1, NMAX
            A( I, J ) = ZERO
            B( I, J ) = ZERO
   10    CONTINUE
   20 CONTINUE
      DO 30 I = 1, NMAX
         A( I, I ) = ONE
         B( I, I ) = ONE
   30 CONTINUE
      OK = .TRUE.
      TOLA = 1.0D0
      TOLB = 1.0D0
      IFST = 1
      ILST = 1
      NT = 0
*
*     Test error exits for the GG path.
*
      IF( LSAMEN( 2, C2, 'GG' ) ) THEN
*
*        czgghrd
*
         SRNAMT = 'czgghrd'
         INFOT = 1
         CALL czgghrd( '/', 'N', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgghrd( 'N', '/', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgghrd('N', 'N', -1, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgghrd( 'N', 'N', 0, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgghrd( 'N', 'N', 0, 1, 1, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgghrd( 'N', 'N', 2, 1, 1, A, 1, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czgghrd( 'N', 'N', 2, 1, 1, A, 2, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czgghrd( 'V', 'N', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czgghrd( 'N', 'V', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'czgghrd', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        czhgeqz
*
         SRNAMT = 'czhgeqz'
         INFOT = 1
         CALL czhgeqz( '/', 'N', 'N', 0, 1, 0, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhgeqz( 'E', '/', 'N', 0, 1, 0, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhgeqz( 'E', 'N', '/', 0, 1, 0, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhgeqz( 'E', 'N', 'N', -1, 0, 0, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czhgeqz( 'E', 'N', 'N', 0, 0, 0, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czhgeqz( 'E', 'N', 'N', 0, 1, 1, A, 1, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhgeqz( 'E', 'N', 'N', 2, 1, 1, A, 1, B, 2, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czhgeqz( 'E', 'N', 'N', 2, 1, 1, A, 2, B, 1, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czhgeqz( 'E', 'V', 'N', 2, 1, 1, A, 2, B, 2, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czhgeqz( 'E', 'N', 'V', 2, 1, 1, A, 2, B, 2, ALPHA, BETA,
     $                Q, 1, Z, 1, W, 1, RW, INFO )
         CALL CHKXER( 'czhgeqz', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cztgevc
*
         SRNAMT = 'cztgevc'
         INFOT = 1
         CALL cztgevc('/', 'A', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztgevc('R', '/', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztgevc( 'R', 'A', SEL, -1, A, 1, B, 1, Q, 1, Z, 1, 0, M,
     $                W, RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztgevc('R', 'A', SEL, 2, A, 1, B, 2, Q, 1, Z, 2, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztgevc('R', 'A', SEL, 2, A, 2, B, 1, Q, 1, Z, 2, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztgevc('L', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cztgevc('R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cztgevc('R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 2, 1, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cztgevc', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GSV path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GSV' ) ) THEN
*
*        czggsvd
*
         SRNAMT = 'czggsvd'
         INFOT = 1
         CALL czggsvd( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggsvd( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggsvd( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czggsvd( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggsvd( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czggsvd( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czggsvd( 'N', 'N', 'N', 2, 1, 1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czggsvd( 'N', 'N', 'N', 1, 1, 2, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czggsvd( 'U', 'N', 'N', 2, 2, 2, DUMMYK, DUMMYL, A, 2, B,
     $                2, R1, R2, U, 1, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czggsvd( 'N', 'V', 'N', 2, 2, 2, DUMMYK, DUMMYL, A, 2, B,
     $                2, R1, R2, U, 2, V, 1, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL czggsvd( 'N', 'N', 'Q', 2, 2, 2, DUMMYK, DUMMYL, A, 2, B,
     $                2, R1, R2, U, 2, V, 2, Q, 1, W, RW, IW, INFO )
         CALL CHKXER( 'czggsvd', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        czggsvp
*
         SRNAMT = 'czggsvp'
         INFOT = 1
         CALL czggsvp( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggsvp( 'N', '/', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggsvp( 'N', 'N', '/', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czggsvp( 'N', 'N', 'N', -1, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggsvp( 'N', 'N', 'N', 0, -1, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czggsvp( 'N', 'N', 'N', 0, 0, -1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czggsvp( 'N', 'N', 'N', 2, 1, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czggsvp( 'N', 'N', 'N', 1, 2, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czggsvp( 'U', 'N', 'N', 2, 2, 2, A, 2, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czggsvp( 'N', 'V', 'N', 2, 2, 2, A, 2, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 2, V, 1, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL czggsvp( 'N', 'N', 'Q', 2, 2, 2, A, 2, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 2, V, 2, Q, 1, IW, RW, TAU, W,
     $                INFO )
         CALL CHKXER( 'czggsvp', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cztgsja
*
         SRNAMT = 'cztgsja'
         INFOT = 1
         CALL cztgsja( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztgsja( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztgsja( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztgsja( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztgsja( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztgsja( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 0, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cztgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                0, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cztgsja( 'U', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 0, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cztgsja( 'N', 'V', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 0, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL cztgsja( 'N', 'N', 'Q', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 0, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cztgsja', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*     Test error exits for the GLM path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GLM' ) ) THEN
*
*        czggglm
*
         SRNAMT = 'czggglm'
         INFOT = 1
         CALL czggglm( -1, 0, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggglm( 0, -1, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggglm( 0, 1, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggglm( 0, 0, -1, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggglm( 1, 0, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggglm( 0, 0, 0, A, 0, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czggglm( 0, 0, 0, A, 1, B, 0, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czggglm( 1, 1, 1, A, 1, B, 1, TAU, ALPHA, BETA, W, 1,
     $                INFO )
         CALL CHKXER( 'czggglm', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the LSE path.
*
      ELSE IF( LSAMEN( 3, PATH, 'LSE' ) ) THEN
*
*        czgglse
*
         SRNAMT = 'czgglse'
         INFOT = 1
         CALL czgglse( -1, 0, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgglse( 0, -1, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgglse( 0, 0, -1, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgglse( 0, 0, 1, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgglse( 0, 1, 0, A, 1, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgglse( 0, 0, 0, A, 0, B, 1, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgglse( 0, 0, 0, A, 1, B, 0, TAU, ALPHA, BETA, W, LW,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgglse( 1, 1, 1, A, 1, B, 1, TAU, ALPHA, BETA, W, 1,
     $                INFO )
         CALL CHKXER( 'czgglse', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GQR path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GQR' ) ) THEN
*
*        czggqrf
*
         SRNAMT = 'czggqrf'
         INFOT = 1
         CALL czggqrf( -1, 0, 0, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggqrf( 0, -1, 0, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggqrf( 0, 0, -1, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggqrf( 0, 0, 0, A, 0, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czggqrf( 0, 0, 0, A, 1, ALPHA, B, 0, BETA, W, LW, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czggqrf( 1, 1, 2, A, 1, ALPHA, B, 1, BETA, W, 1, INFO )
         CALL CHKXER( 'czggqrf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        czggrqf
*
         SRNAMT = 'czggrqf'
         INFOT = 1
         CALL czggrqf( -1, 0, 0, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggrqf( 0, -1, 0, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggrqf( 0, 0, -1, A, 1, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggrqf( 0, 0, 0, A, 0, ALPHA, B, 1, BETA, W, LW, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czggrqf( 0, 0, 0, A, 1, ALPHA, B, 0, BETA, W, LW, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czggrqf( 1, 1, 2, A, 1, ALPHA, B, 1, BETA, W, 1, INFO )
         CALL CHKXER( 'czggrqf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*     Test error exits for the ZGS, ZGV, ZGX, and ZXV paths.
*
      ELSE IF( LSAMEN( 3, PATH, 'ZGS' ) .OR.
     $         LSAMEN( 3, PATH, 'ZGV' ) .OR.
     $         LSAMEN( 3, PATH, 'ZGX' ) .OR. LSAMEN( 3, PATH, 'ZXV' ) )
     $          THEN
*
*        czgges
*
         SRNAMT = 'czgges '
         INFOT = 1
         CALL czgges( '/', 'N', 'S', ZLCTES, 1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgges( 'N', '/', 'S', ZLCTES, 1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgges( 'N', 'V', '/', ZLCTES, 1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgges('N', 'V', 'S', ZLCTES, -1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgges( 'N', 'V', 'S', ZLCTES, 1, A, 0, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czgges( 'N', 'V', 'S', ZLCTES, 1, A, 1, B, 0, SDIM, ALPHA,
     $               BETA, Q, 1, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czgges( 'N', 'V', 'S', ZLCTES, 1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 0, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czgges( 'V', 'V', 'S', ZLCTES, 2, A, 2, B, 2, SDIM, ALPHA,
     $               BETA, Q, 1, U, 2, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czgges( 'N', 'V', 'S', ZLCTES, 1, A, 1, B, 1, SDIM, ALPHA,
     $               BETA, Q, 1, U, 0, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czgges( 'V', 'V', 'S', ZLCTES, 2, A, 2, B, 2, SDIM, ALPHA,
     $               BETA, Q, 2, U, 1, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czgges( 'V', 'V', 'S', ZLCTES, 2, A, 2, B, 2, SDIM, ALPHA,
     $               BETA, Q, 2, U, 2, W, 1, RW, BW, INFO )
         CALL CHKXER( 'czgges ', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        czggesX
*
         SRNAMT = 'czggesX'
         INFOT = 1
         CALL czggesX( '/', 'N', 'S', ZLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggesX( 'N', '/', 'S', ZLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggesX( 'V', 'V', '/', ZLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, '/', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', -1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 1, A, 0, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 1, A, 1, B, 0, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 0, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 0, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 17
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                ALPHA, BETA, Q, 2, U, 1, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 21
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                ALPHA, BETA, Q, 2, U, 2, RCE, RCV, W, 1, RW, IW,
     $                1, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         INFOT = 24
         CALL czggesX( 'V', 'V', 'S', ZLCTSX, 'V', 1, A, 1, B, 1, SDIM,
     $                ALPHA, BETA, Q, 1, U, 1, RCE, RCV, W, 32, RW, IW,
     $                0, BW, INFO )
         CALL CHKXER( 'czggesX', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        czggev
*
         SRNAMT = 'czggev '
         INFOT = 1
         CALL czggev( '/', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggev( 'N', '/', 1, A, 1, B, 1, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggev( 'V', 'V', -1, A, 1, B, 1, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggev( 'V', 'V', 1, A, 0, B, 1, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czggev( 'V', 'V', 1, A, 1, B, 0, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czggev( 'N', 'V', 1, A, 1, B, 1, ALPHA, BETA, Q, 0, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czggev( 'V', 'V', 2, A, 2, B, 2, ALPHA, BETA, Q, 1, U, 2,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czggev( 'V', 'N', 2, A, 2, B, 2, ALPHA, BETA, Q, 2, U, 0,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czggev( 'V', 'V', 2, A, 2, B, 2, ALPHA, BETA, Q, 2, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czggev( 'V', 'V', 1, A, 1, B, 1, ALPHA, BETA, Q, 1, U, 1,
     $               W, 1, RW, INFO )
         CALL CHKXER( 'czggev ', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        czggevX
*
         SRNAMT = 'czggevX'
         INFOT = 1
         CALL czggevX('/', 'N', 'N', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czggevX('N', '/', 'N', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czggevX('N', 'N', '/', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $             1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czggevX('N', 'N', 'N', '/', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czggevX( 'N', 'N', 'N', 'N', -1, A, 1, B, 1, ALPHA, BETA,
     $             Q, 1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W,
     $                1, RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czggevX('N', 'N', 'N', 'N', 1, A, 0, B, 1, ALPHA, BETA, Q,
     $             1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czggevX('N', 'N', 'N', 'N', 1, A, 1, B, 0, ALPHA, BETA, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czggevX('N', 'N', 'N', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $           0, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czggevX('N', 'V', 'N', 'N', 2, A, 2, B, 2, ALPHA, BETA, Q,
     $           1, U, 2, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czggevX('N', 'N', 'N', 'N', 1, A, 1, B, 1, ALPHA, BETA, Q,
     $             1, U, 0, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL czggevX('N', 'N', 'V', 'N', 2, A, 2, B, 2, ALPHA, BETA, Q,
     $              2, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         INFOT = 25
         CALL czggevX('N', 'N', 'V', 'N', 2, A, 2, B, 2, ALPHA, BETA, Q,
     $            2, U, 2, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 0,
     $                RW, IW, BW, INFO )
         CALL CHKXER( 'czggevX', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cztgexc
*
         SRNAMT = 'cztgexc'
         INFOT = 3
         CALL cztgexc( .TRUE., .TRUE., -1, A, 1, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztgexc( .TRUE., .TRUE., 1, A, 0, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cztgexc( .TRUE., .TRUE., 1, A, 1, B, 0, Q, 1, Z, 1, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cztgexc( .FALSE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cztgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cztgexc( .TRUE., .FALSE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cztgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, INFO )
         CALL CHKXER( 'cztgexc', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        cztgsen
*
         SRNAMT = 'cztgsen'
         INFOT = 1
         CALL cztgsen( -1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, -1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, 1, A, 0, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 0, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 0, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 0, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 21
         CALL cztgsen( 3, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, -5, IW,
     $                1, INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 23
         CALL cztgsen( 0, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW,
     $                0, INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 23
         CALL cztgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW,
     $                0, INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         INFOT = 23
         CALL cztgsen( 5, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, ALPHA,
     $                BETA, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW,
     $                1, INFO )
         CALL CHKXER( 'cztgsen', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cztgsna
*
         SRNAMT = 'cztgsna'
         INFOT = 1
         CALL cztgsna( '/', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztgsna( 'B', '/', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztgsna('B', 'A', SEL, -1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztgsna( 'B', 'A', SEL, 1, A, 0, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztgsna( 'B', 'A', SEL, 1, A, 1, B, 0, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 0, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cztgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 0, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cztgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                0, M, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cztgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 0, IW, INFO )
         CALL CHKXER( 'cztgsna', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cztgsyl
*
         SRNAMT = 'cztgsyl'
         INFOT = 1
         CALL cztgsyl( '/', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztgsyl('N', -1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztgsyl( 'N', 0, 0, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztgsyl( 'N', 0, 1, 0, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztgsyl( 'N', 0, 1, 1, A, 0, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztgsyl( 'N', 0, 1, 1, A, 1, B, 0, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 0, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cztgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 0, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cztgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 0, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cztgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 0,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cztgsyl( 'N', 1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cztgsyl( 'N', 2, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cztgsyl', INFOT, NOUT, LERR, OK )
         NT = NT + 12
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
 9999 FORMAT( 1X, A3, ' routines passed the tests of the error exits (',
     $      I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of ZERRGG
*
      END
