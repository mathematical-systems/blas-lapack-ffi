      SUBROUTINE DERRGG( PATH, NUNIT )
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
*  DERRGG tests the error exits for cdgges, cdggesX, cdggev, cdggevX,
*  cdggglm, cdgghrd, cdgglse, cdggqrf, cdggrqf, cdggsvd, cdggsvp, cdhgeqz,
*  cdtgevc, cdtgexc, cdtgsen, cdtgsja, cdtgsna, and cdtgsyl.
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
      INTEGER P1,P2
*     ..
*     .. Local Arrays ..
      LOGICAL            BW( NMAX ), SEL( NMAX )
      INTEGER            IW( NMAX )
      DOUBLE PRECISION   A( NMAX, NMAX ), B( NMAX, NMAX ), LS( NMAX ),
     $                   Q( NMAX, NMAX ), R1( NMAX ), R2( NMAX ),
     $                   R3( NMAX ), RCE( 2 ), RCV( 2 ), RS( NMAX ),
     $                   TAU( NMAX ), U( NMAX, NMAX ), V( NMAX, NMAX ),
     $                   W( LW ), Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            DLCTES, DLCTSX, LSAMEN
      EXTERNAL           DLCTES, DLCTSX, LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, cdgges, cdggesX, cdggev, cdggevX, cdggglm,
     $             cdgghrd, cdgglse, cdggqrf, cdggrqf, cdggsvd, cdggsvp,
     $             cdhgeqz, cdtgevc, cdtgexc, cdtgsen, cdtgsja, cdtgsna,
     $                   cdtgsyl
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
*        cdgghrd
*
         SRNAMT = 'cdgghrd'
         INFOT = 1
         CALL cdgghrd( '/', 'N', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgghrd( 'N', '/', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdgghrd( 'N', 'N', -1, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgghrd( 'N', 'N', 0, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgghrd( 'N', 'N', 0, 1, 1, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdgghrd( 'N', 'N', 2, 1, 1, A, 1, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdgghrd( 'N', 'N', 2, 1, 1, A, 2, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdgghrd( 'V', 'N', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdgghrd( 'N', 'V', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'cdgghrd', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdhgeqz
*
         SRNAMT = 'cdhgeqz'
         INFOT = 1
        CALL cdhgeqz( '/', 'N', 'N', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdhgeqz( 'E', '/', 'N', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdhgeqz( 'E', 'N', '/', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdhgeqz( 'E', 'N', 'N', -1, 0, 0, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cdhgeqz( 'E', 'N', 'N', 0, 0, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdhgeqz( 'E', 'N', 'N', 0, 1, 1, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdhgeqz( 'E', 'N', 'N', 2, 1, 1, A, 1, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cdhgeqz( 'E', 'N', 'N', 2, 1, 1, A, 2, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cdhgeqz( 'E', 'V', 'N', 2, 1, 1, A, 2, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cdhgeqz( 'E', 'N', 'V', 2, 1, 1, A, 2, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cdhgeqz', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdtgevc
*
         SRNAMT = 'cdtgevc'
         INFOT = 1
        CALL cdtgevc( '/', 'A', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdtgevc( 'R', '/', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdtgevc( 'R', 'A', SEL, -1, A, 1, B, 1, Q, 1, Z, 1, 0, M,
     $                W, INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cdtgevc( 'R', 'A', SEL, 2, A, 1, B, 2, Q, 1, Z, 2, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cdtgevc( 'R', 'A', SEL, 2, A, 2, B, 1, Q, 1, Z, 2, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cdtgevc( 'L', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cdtgevc( 'R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cdtgevc( 'R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 2, 1, M, W,
     $                INFO )
         CALL CHKXER( 'cdtgevc', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GSV path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GSV' ) ) THEN
*
*        cdggsvd
*
         SRNAMT = 'cdggsvd'
         INFOT = 1
         CALL cdggsvd( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggsvd( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggsvd( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdggsvd( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggsvd( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdggsvd( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdggsvd( 'N', 'N', 'N', 2, 1, 1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdggsvd( 'N', 'N', 'N', 1, 1, 2, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdggsvd( 'U', 'N', 'N', 2, 2, 2, DUMMYK, DUMMYL, A, 2, B,
     $                2, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdggsvd( 'N', 'V', 'N', 1, 1, 2, DUMMYK, DUMMYL, A, 1, B,
     $                2, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cdggsvd( 'N', 'N', 'Q', 1, 2, 1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'cdggsvd', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cdggsvp
*
         SRNAMT = 'cdggsvp'
         INFOT = 1
         CALL cdggsvp( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggsvp( 'N', '/', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggsvp( 'N', 'N', '/', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdggsvp( 'N', 'N', 'N', -1, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggsvp( 'N', 'N', 'N', 0, -1, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdggsvp( 'N', 'N', 'N', 0, 0, -1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdggsvp( 'N', 'N', 'N', 2, 1, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdggsvp( 'N', 'N', 'N', 1, 2, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdggsvp( 'U', 'N', 'N', 2, 2, 2, A, 2, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdggsvp( 'N', 'V', 'N', 1, 2, 1, A, 1, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cdggsvp( 'N', 'N', 'Q', 1, 1, 2, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'cdggsvp', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cdtgsja
*
         SRNAMT = 'cdtgsja'
         INFOT = 1
         CALL cdtgsja( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdtgsja( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdtgsja( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdtgsja( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdtgsja( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdtgsja( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdtgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 0, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdtgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                0, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdtgsja( 'U', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 0, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cdtgsja( 'N', 'V', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 0, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL cdtgsja( 'N', 'N', 'Q', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 0, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cdtgsja', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*     Test error exits for the GLM path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GLM' ) ) THEN
*
*        cdggglm
*
         SRNAMT = 'cdggglm'
         INFOT = 1
         CALL cdggglm( -1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggglm( 0, -1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggglm( 0, 1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggglm( 0, 0, -1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggglm( 1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggglm( 0, 0, 0, A, 0, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdggglm( 0, 0, 0, A, 1, B, 0, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdggglm( 1, 1, 1, A, 1, B, 1, R1, R2, R3, W, 1, INFO )
         CALL CHKXER( 'cdggglm', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the LSE path.
*
      ELSE IF( LSAMEN( 3, PATH, 'LSE' ) ) THEN
*
*        cdgglse
*
         SRNAMT = 'cdgglse'
         INFOT = 1
         CALL cdgglse( -1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgglse( 0, -1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgglse( 0, 0, -1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgglse( 0, 0, 1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgglse( 0, 1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgglse( 0, 0, 0, A, 0, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdgglse( 0, 0, 0, A, 1, B, 0, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdgglse( 1, 1, 1, A, 1, B, 1, R1, R2, R3, W, 1, INFO )
         CALL CHKXER( 'cdgglse', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GQR path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GQR' ) ) THEN
*
*        cdggqrf
*
         SRNAMT = 'cdggqrf'
         INFOT = 1
         CALL cdggqrf( -1, 0, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggqrf( 0, -1, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggqrf( 0, 0, -1, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggqrf( 0, 0, 0, A, 0, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdggqrf( 0, 0, 0, A, 1, R1, B, 0, R2, W, LW, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdggqrf( 1, 1, 2, A, 1, R1, B, 1, R2, W, 1, INFO )
         CALL CHKXER( 'cdggqrf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        cdggrqf
*
         SRNAMT = 'cdggrqf'
         INFOT = 1
         CALL cdggrqf( -1, 0, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggrqf( 0, -1, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggrqf( 0, 0, -1, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggrqf( 0, 0, 0, A, 0, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdggrqf( 0, 0, 0, A, 1, R1, B, 0, R2, W, LW, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdggrqf( 1, 1, 2, A, 1, R1, B, 1, R2, W, 1, INFO )
         CALL CHKXER( 'cdggrqf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*     Test error exits for the DGS, DGV, DGX, and DXV paths.
*
      ELSE IF( LSAMEN( 3, PATH, 'DGS' ) .OR.
     $         LSAMEN( 3, PATH, 'DGV' ) .OR.
     $         LSAMEN( 3, PATH, 'DGX' ) .OR. LSAMEN( 3, PATH, 'DXV' ) )
     $          THEN
*
*        cdgges
*
         SRNAMT = 'cdgges '
         INFOT = 1
        CALL cdgges( '/', 'N', 'S', DLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdgges( 'N', '/', 'S', DLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdgges( 'N', 'V', '/', DLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgges( 'N', 'V', 'S', DLCTES, -1, A, 1, B, 1, SDIM, R1,
     $               R2, R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdgges( 'N', 'V', 'S', DLCTES, 1, A, 0, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdgges( 'N', 'V', 'S', DLCTES, 1, A, 1, B, 0, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cdgges( 'N', 'V', 'S', DLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 0, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
        INFOT = 15
        CALL cdgges( 'V', 'V', 'S', DLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 1, U, 2, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cdgges( 'N', 'V', 'S', DLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 0, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cdgges( 'V', 'V', 'S', DLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 2, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         INFOT = 19
        CALL cdgges( 'V', 'V', 'S', DLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 2, U, 2, W, 1, BW, INFO )
         CALL CHKXER( 'cdgges ', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cdggesX
*
         SRNAMT = 'cdggesX'
         INFOT = 1
         CALL cdggesX( '/', 'N', 'S', DLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggesX( 'N', '/', 'S', DLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggesX( 'V', 'V', '/', DLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, '/', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', -1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 1, A, 0, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 1, A, 1, B, 0, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 0, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 0, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 2, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 2, U, 2, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         INFOT = 24
         CALL cdggesX( 'V', 'V', 'S', DLCTSX, 'V', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 32, IW, 0,
     $                BW, INFO )
         CALL CHKXER( 'cdggesX', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        cdggev
*
         SRNAMT = 'cdggev '
         INFOT = 1
        CALL cdggev( '/', 'N', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdggev( 'N', '/', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggev( 'V', 'V', -1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1,
     $               W, 1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cdggev( 'V', 'V', 1, A, 0, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdggev( 'V', 'V', 1, A, 1, B, 0, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cdggev( 'N', 'V', 1, A, 1, B, 1, R1, R2, R3, Q, 0, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cdggev( 'V', 'V', 2, A, 2, B, 2, R1, R2, R3, Q, 1, U, 2, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cdggev( 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q, 2, U, 0, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cdggev( 'V', 'V', 2, A, 2, B, 2, R1, R2, R3, Q, 2, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         INFOT = 16
        CALL cdggev( 'V', 'V', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'cdggev ', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdggevX
*
         SRNAMT = 'cdggevX'
         INFOT = 1
		 P1 = 1
		 P2 = 1
         CALL cdggevX( '/', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdggevX( 'N', '/', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdggevX( 'N', 'N', '/', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdggevX( 'N', 'N', 'N', '/', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cdggevX( 'N', 'N', 'N', 'N', -1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdggevX( 'N', 'N', 'N', 'N', 1, A, 0, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 0, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cdggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              0, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
		 P2 = 2
         CALL cdggevX( 'N', 'V', 'N', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $              1, U, 2, P1, P1, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 16
		 P2 = 1
         CALL cdggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $            1, U, 0, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 16
		 P2 = 2
         CALL cdggevX( 'N', 'N', 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $              2, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         INFOT = 26
         CALL cdggevX( 'N', 'N', 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $              2, U, 2, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'cdggevX', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cdtgexc
*
         SRNAMT = 'cdtgexc'
         INFOT = 3
         CALL cdtgexc( .TRUE., .TRUE., -1, A, 1, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdtgexc( .TRUE., .TRUE., 1, A, 0, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdtgexc( .TRUE., .TRUE., 1, A, 1, B, 0, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdtgexc( .FALSE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdtgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdtgexc( .TRUE., .FALSE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdtgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cdtgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 0, INFO )
         CALL CHKXER( 'cdtgexc', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cdtgsen
*
         SRNAMT = 'cdtgsen'
         INFOT = 1
         CALL cdtgsen( -1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2,
     $                R3, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdtgsen( 1, .TRUE., .TRUE., SEL, -1, A, 1, B, 1, R1, R2,
     $                R3, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 0, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
        INFOT = 9
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 0, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 0, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 16
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 0, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cdtgsen( 0, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cdtgsen( 2, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cdtgsen( 0, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 0,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cdtgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 0,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cdtgsen( 2, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 1,
     $                INFO )
         CALL CHKXER( 'cdtgsen', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cdtgsna
*
         SRNAMT = 'cdtgsna'
         INFOT = 1
         CALL cdtgsna( '/', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdtgsna( 'B', '/', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cdtgsna( 'B', 'A', SEL, -1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdtgsna( 'B', 'A', SEL, 1, A, 0, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdtgsna( 'B', 'A', SEL, 1, A, 1, B, 0, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdtgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 0, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdtgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 0, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cdtgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                0, M, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cdtgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 0, IW, INFO )
         CALL CHKXER( 'cdtgsna', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdtgsyl
*
         SRNAMT = 'cdtgsyl'
         INFOT = 1
         CALL cdtgsyl( '/', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdtgsyl( 'N', -1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdtgsyl( 'N', 0, 0, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdtgsyl( 'N', 0, 1, 0, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdtgsyl( 'N', 0, 1, 1, A, 0, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdtgsyl( 'N', 0, 1, 1, A, 1, B, 0, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdtgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 0, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cdtgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 0, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cdtgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 0, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cdtgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 0,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cdtgsyl( 'N', 1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cdtgsyl( 'N', 2, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cdtgsyl', INFOT, NOUT, LERR, OK )
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
*     End of DERRGG
*
      END
