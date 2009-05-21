      SUBROUTINE SERRGG( PATH, NUNIT )
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
*  SERRGG tests the error exits for csgges, csggesX, csggev, csggevX,
*  csggglm, csgghrd, csgglse, csggqrf, csggrqf, csggsvd, csggsvp, cshgeqz,
*  cstgevc, cstgexc, cstgsen, cstgsja, cstgsna, and cstgsyl.
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
      REAL               ONE, ZERO
      PARAMETER          ( ONE = 1.0E+0, ZERO = 0.0E+0 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            DUMMYK, DUMMYL, I, IFST, ILST, INFO, J, M,
     $                   NCYCLE, NT, SDIM
      REAL               ANRM, BNRM, DIF, SCALE, TOLA, TOLB
      INTEGER            P1, P2
*     ..
*     .. Local Arrays ..
      LOGICAL            BW( NMAX ), SEL( NMAX )
      INTEGER            IW( NMAX )
      REAL               A( NMAX, NMAX ), B( NMAX, NMAX ), LS( NMAX ),
     $                   Q( NMAX, NMAX ), R1( NMAX ), R2( NMAX ),
     $                   R3( NMAX ), RCE( 2 ), RCV( 2 ), RS( NMAX ),
     $                   TAU( NMAX ), U( NMAX, NMAX ), V( NMAX, NMAX ),
     $                   W( LW ), Z( NMAX, NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN, SLCTES, SLCTSX
      EXTERNAL           LSAMEN, SLCTES, SLCTSX
*     ..
*     .. External Subroutines ..
      EXTERNAL        CHKXER, csgges, csggesX, csggev, csggevX, csggglm,
     $             csgghrd, csgglse, csggqrf, csggrqf, csggsvd, csggsvp,
     $             cshgeqz, cstgevc, cstgexc, cstgsen, cstgsja, cstgsna,
     $                   cstgsyl
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
      TOLA = 1.0E0
      TOLB = 1.0E0
      IFST = 1
      ILST = 1
      NT = 0
*
*     Test error exits for the GG path.
*
      IF( LSAMEN( 2, C2, 'GG' ) ) THEN
*
*        csgghrd
*
         SRNAMT = 'csgghrd'
         INFOT = 1
         CALL csgghrd( '/', 'N', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgghrd( 'N', '/', 0, 1, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csgghrd( 'N', 'N', -1, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgghrd( 'N', 'N', 0, 0, 0, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgghrd( 'N', 'N', 0, 1, 1, A, 1, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgghrd( 'N', 'N', 2, 1, 1, A, 1, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csgghrd( 'N', 'N', 2, 1, 1, A, 2, B, 1, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csgghrd( 'V', 'N', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csgghrd( 'N', 'V', 2, 1, 1, A, 2, B, 2, Q, 1, Z, 1, INFO )
         CALL CHKXER( 'csgghrd', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cshgeqz
*
         SRNAMT = 'cshgeqz'
         INFOT = 1
        CALL cshgeqz( '/', 'N', 'N', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cshgeqz( 'E', '/', 'N', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cshgeqz( 'E', 'N', '/', 0, 1, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cshgeqz( 'E', 'N', 'N', -1, 0, 0, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cshgeqz( 'E', 'N', 'N', 0, 0, 0, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cshgeqz( 'E', 'N', 'N', 0, 1, 1, A, 1, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cshgeqz( 'E', 'N', 'N', 2, 1, 1, A, 1, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cshgeqz( 'E', 'N', 'N', 2, 1, 1, A, 2, B, 1, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL cshgeqz( 'E', 'V', 'N', 2, 1, 1, A, 2, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL cshgeqz( 'E', 'N', 'V', 2, 1, 1, A, 2, B, 2, R1, R2, R3, Q,
     $                1, Z, 1, W, LW, INFO )
         CALL CHKXER( 'cshgeqz', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cstgevc
*
         SRNAMT = 'cstgevc'
         INFOT = 1
        CALL cstgevc( '/', 'A', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cstgevc( 'R', '/', SEL, 0, A, 1, B, 1, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstgevc( 'R', 'A', SEL, -1, A, 1, B, 1, Q, 1, Z, 1, 0, M,
     $                W, INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cstgevc( 'R', 'A', SEL, 2, A, 1, B, 2, Q, 1, Z, 2, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cstgevc( 'R', 'A', SEL, 2, A, 2, B, 1, Q, 1, Z, 2, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cstgevc( 'L', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL cstgevc( 'R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cstgevc( 'R', 'A', SEL, 2, A, 2, B, 2, Q, 1, Z, 2, 1, M, W,
     $                INFO )
         CALL CHKXER( 'cstgevc', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GSV path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GSV' ) ) THEN
*
*        csggsvd
*
         SRNAMT = 'csggsvd'
         INFOT = 1
         CALL csggsvd( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggsvd( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggsvd( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csggsvd( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggsvd( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csggsvd( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csggsvd( 'N', 'N', 'N', 2, 1, 1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csggsvd( 'N', 'N', 'N', 1, 1, 2, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggsvd( 'U', 'N', 'N', 2, 2, 2, DUMMYK, DUMMYL, A, 2, B,
     $                2, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL csggsvd( 'N', 'V', 'N', 1, 1, 2, DUMMYK, DUMMYL, A, 1, B,
     $                2, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL csggsvd( 'N', 'N', 'Q', 1, 2, 1, DUMMYK, DUMMYL, A, 1, B,
     $                1, R1, R2, U, 1, V, 1, Q, 1, W, IW, INFO )
         CALL CHKXER( 'csggsvd', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        csggsvp
*
         SRNAMT = 'csggsvp'
         INFOT = 1
         CALL csggsvp( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggsvp( 'N', '/', 'N', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggsvp( 'N', 'N', '/', 0, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csggsvp( 'N', 'N', 'N', -1, 0, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggsvp( 'N', 'N', 'N', 0, -1, 0, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csggsvp( 'N', 'N', 'N', 0, 0, -1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csggsvp( 'N', 'N', 'N', 2, 1, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csggsvp( 'N', 'N', 'N', 1, 2, 1, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggsvp( 'U', 'N', 'N', 2, 2, 2, A, 2, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL csggsvp( 'N', 'V', 'N', 1, 2, 1, A, 1, B, 2, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL csggsvp( 'N', 'N', 'Q', 1, 1, 2, A, 1, B, 1, TOLA, TOLB,
     $                DUMMYK, DUMMYL, U, 1, V, 1, Q, 1, IW, TAU, W,
     $                INFO )
         CALL CHKXER( 'csggsvp', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        cstgsja
*
         SRNAMT = 'cstgsja'
         INFOT = 1
         CALL cstgsja( '/', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstgsja( 'N', '/', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstgsja( 'N', 'N', '/', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstgsja( 'N', 'N', 'N', -1, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstgsja( 'N', 'N', 'N', 0, -1, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstgsja( 'N', 'N', 'N', 0, 0, -1, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 0, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cstgsja( 'N', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                0, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cstgsja( 'U', 'N', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 0, V, 1, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cstgsja( 'N', 'V', 'N', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 0, Q, 1, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL cstgsja( 'N', 'N', 'Q', 0, 0, 0, DUMMYK, DUMMYL, A, 1, B,
     $                1, TOLA, TOLB, R1, R2, U, 1, V, 1, Q, 0, W,
     $                NCYCLE, INFO )
         CALL CHKXER( 'cstgsja', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*     Test error exits for the GLM path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GLM' ) ) THEN
*
*        csggglm
*
         SRNAMT = 'csggglm'
         INFOT = 1
         CALL csggglm( -1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggglm( 0, -1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggglm( 0, 1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggglm( 0, 0, -1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggglm( 1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggglm( 0, 0, 0, A, 0, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csggglm( 0, 0, 0, A, 1, B, 0, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csggglm( 1, 1, 1, A, 1, B, 1, R1, R2, R3, W, 1, INFO )
         CALL CHKXER( 'csggglm', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the LSE path.
*
      ELSE IF( LSAMEN( 3, PATH, 'LSE' ) ) THEN
*
*        csgglse
*
         SRNAMT = 'csgglse'
         INFOT = 1
         CALL csgglse( -1, 0, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgglse( 0, -1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgglse( 0, 0, -1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgglse( 0, 0, 1, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgglse( 0, 1, 0, A, 1, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgglse( 0, 0, 0, A, 0, B, 1, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgglse( 0, 0, 0, A, 1, B, 0, R1, R2, R3, W, LW, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgglse( 1, 1, 1, A, 1, B, 1, R1, R2, R3, W, 1, INFO )
         CALL CHKXER( 'csgglse', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*     Test error exits for the GQR path.
*
      ELSE IF( LSAMEN( 3, PATH, 'GQR' ) ) THEN
*
*        csggqrf
*
         SRNAMT = 'csggqrf'
         INFOT = 1
         CALL csggqrf( -1, 0, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggqrf( 0, -1, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggqrf( 0, 0, -1, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggqrf( 0, 0, 0, A, 0, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csggqrf( 0, 0, 0, A, 1, R1, B, 0, R2, W, LW, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csggqrf( 1, 1, 2, A, 1, R1, B, 1, R2, W, 1, INFO )
         CALL CHKXER( 'csggqrf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*        csggrqf
*
         SRNAMT = 'csggrqf'
         INFOT = 1
         CALL csggrqf( -1, 0, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggrqf( 0, -1, 0, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggrqf( 0, 0, -1, A, 1, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggrqf( 0, 0, 0, A, 0, R1, B, 1, R2, W, LW, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csggrqf( 0, 0, 0, A, 1, R1, B, 0, R2, W, LW, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csggrqf( 1, 1, 2, A, 1, R1, B, 1, R2, W, 1, INFO )
         CALL CHKXER( 'csggrqf', INFOT, NOUT, LERR, OK )
         NT = NT + 6
*
*     Test error exits for the SGS, SGV, SGX, and SXV paths.
*
      ELSE IF( LSAMEN( 3, PATH, 'SGS' ) .OR.
     $         LSAMEN( 3, PATH, 'SGV' ) .OR.
     $         LSAMEN( 3, PATH, 'SGX' ) .OR. LSAMEN( 3, PATH, 'SXV' ) )
     $          THEN
*
*        csgges
*
         SRNAMT = 'csgges '
         INFOT = 1
        CALL csgges( '/', 'N', 'S', SLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csgges( 'N', '/', 'S', SLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL csgges( 'N', 'V', '/', SLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgges( 'N', 'V', 'S', SLCTES, -1, A, 1, B, 1, SDIM, R1,
     $               R2, R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csgges( 'N', 'V', 'S', SLCTES, 1, A, 0, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL csgges( 'N', 'V', 'S', SLCTES, 1, A, 1, B, 0, SDIM, R1, R2,
     $               R3, Q, 1, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL csgges( 'N', 'V', 'S', SLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 0, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL csgges( 'V', 'V', 'S', SLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 1, U, 2, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL csgges( 'N', 'V', 'S', SLCTES, 1, A, 1, B, 1, SDIM, R1, R2,
     $               R3, Q, 1, U, 0, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 17
        CALL csgges( 'V', 'V', 'S', SLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 2, U, 1, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         INFOT = 19
        CALL csgges( 'V', 'V', 'S', SLCTES, 2, A, 2, B, 2, SDIM, R1, R2,
     $               R3, Q, 2, U, 2, W, 1, BW, INFO )
         CALL CHKXER( 'csgges ', INFOT, NOUT, LERR, OK )
         NT = NT + 11
*
*        csggesX
*
         SRNAMT = 'csggesX'
         INFOT = 1
         CALL csggesX( '/', 'N', 'S', SLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggesX( 'N', '/', 'S', SLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggesX( 'V', 'V', '/', SLCTSX, 'N', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csggesX( 'V', 'V', 'S', SLCTSX, '/', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', -1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 1, A, 0, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 1, A, 1, B, 0, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 0, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 0, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 2, U, 1, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 22
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'B', 2, A, 2, B, 2, SDIM,
     $                R1, R2, R3, Q, 2, U, 2, RCE, RCV, W, 1, IW, 1, BW,
     $                INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         INFOT = 24
         CALL csggesX( 'V', 'V', 'S', SLCTSX, 'V', 1, A, 1, B, 1, SDIM,
     $                R1, R2, R3, Q, 1, U, 1, RCE, RCV, W, 32, IW, 0,
     $                BW, INFO )
         CALL CHKXER( 'csggesX', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        csggev
*
         SRNAMT = 'csggev '
         INFOT = 1
        CALL csggev( '/', 'N', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL csggev( 'N', '/', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggev( 'V', 'V', -1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1,
     $               W, 1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL csggev( 'V', 'V', 1, A, 0, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL csggev( 'V', 'V', 1, A, 1, B, 0, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL csggev( 'N', 'V', 1, A, 1, B, 1, R1, R2, R3, Q, 0, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL csggev( 'V', 'V', 2, A, 2, B, 2, R1, R2, R3, Q, 1, U, 2, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL csggev( 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q, 2, U, 0, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL csggev( 'V', 'V', 2, A, 2, B, 2, R1, R2, R3, Q, 2, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         INFOT = 16
        CALL csggev( 'V', 'V', 1, A, 1, B, 1, R1, R2, R3, Q, 1, U, 1, W,
     $               1, INFO )
         CALL CHKXER( 'csggev ', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        csggevX
*
         SRNAMT = 'csggevX'
         INFOT = 1
         CALL csggevX( '/', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csggevX( 'N', '/', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $           1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csggevX( 'N', 'N', '/', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csggevX( 'N', 'N', 'N', '/', 1, A, 1, B, 1, R1, R2, R3, Q,
     $           1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL csggevX( 'N', 'N', 'N', 'N', -1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csggevX( 'N', 'N', 'N', 'N', 1, A, 0, B, 1, R1, R2, R3, Q,
     $            1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 0, R1, R2, R3, Q,
     $              1, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $            0, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csggevX( 'N', 'V', 'N', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $              1, U, 2, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggevX( 'N', 'N', 'N', 'N', 1, A, 1, B, 1, R1, R2, R3, Q,
     $              1, U, 0, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csggevX( 'N', 'N', 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $              2, U, 1, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         INFOT = 26
         CALL csggevX( 'N', 'N', 'V', 'N', 2, A, 2, B, 2, R1, R2, R3, Q,
     $           2, U, 2, P1, P2, LS, RS, ANRM, BNRM, RCE, RCV, W, 1,
     $                IW, BW, INFO )
         CALL CHKXER( 'csggevX', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cstgexc
*
         SRNAMT = 'cstgexc'
         INFOT = 3
         CALL cstgexc( .TRUE., .TRUE., -1, A, 1, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstgexc( .TRUE., .TRUE., 1, A, 0, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cstgexc( .TRUE., .TRUE., 1, A, 1, B, 0, Q, 1, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cstgexc( .FALSE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cstgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 0, Z, 1, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cstgexc( .TRUE., .FALSE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cstgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 1, Z, 0, IFST,
     $                ILST, W, 1, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cstgexc( .TRUE., .TRUE., 1, A, 1, B, 1, Q, 1, Z, 1, IFST,
     $                ILST, W, 0, INFO )
         CALL CHKXER( 'cstgexc', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cstgsen
*
         SRNAMT = 'cstgsen'
         INFOT = 1
         CALL cstgsen( -1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2,
     $                R3, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstgsen( 1, .TRUE., .TRUE., SEL, -1, A, 1, B, 1, R1, R2,
     $                R3, Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 0, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 0, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 0, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 16
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 0, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cstgsen( 0, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 22
        CALL cstgsen( 2, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 1, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cstgsen( 0, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 0,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cstgsen( 1, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 0,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         INFOT = 24
        CALL cstgsen( 2, .TRUE., .TRUE., SEL, 1, A, 1, B, 1, R1, R2, R3,
     $                Q, 1, Z, 1, M, TOLA, TOLB, RCV, W, 20, IW, 1,
     $                INFO )
         CALL CHKXER( 'cstgsen', INFOT, NOUT, LERR, OK )
         NT = NT + 12
*
*        cstgsna
*
         SRNAMT = 'cstgsna'
         INFOT = 1
         CALL cstgsna( '/', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstgsna( 'B', '/', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cstgsna( 'B', 'A', SEL, -1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstgsna( 'B', 'A', SEL, 1, A, 0, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstgsna( 'B', 'A', SEL, 1, A, 1, B, 0, Q, 1, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 0, U, 1, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cstgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 0, R1, R2,
     $                1, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cstgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                0, M, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cstgsna( 'E', 'A', SEL, 1, A, 1, B, 1, Q, 1, U, 1, R1, R2,
     $                1, M, W, 0, IW, INFO )
         CALL CHKXER( 'cstgsna', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cstgsyl
*
         SRNAMT = 'cstgsyl'
         INFOT = 1
         CALL cstgsyl( '/', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cstgsyl( 'N', -1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstgsyl( 'N', 0, 0, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstgsyl( 'N', 0, 1, 0, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstgsyl( 'N', 0, 1, 1, A, 0, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstgsyl( 'N', 0, 1, 1, A, 1, B, 0, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 0, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cstgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 0, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL cstgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 0, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL cstgsyl( 'N', 0, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 0,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cstgsyl( 'N', 1, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
         INFOT = 20
         CALL cstgsyl( 'N', 2, 1, 1, A, 1, B, 1, Q, 1, U, 1, V, 1, Z, 1,
     $                SCALE, DIF, W, 1, IW, INFO )
         CALL CHKXER( 'cstgsyl', INFOT, NOUT, LERR, OK )
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
*     End of SERRGG
*
      END
