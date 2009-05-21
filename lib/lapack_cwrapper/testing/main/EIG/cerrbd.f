      SUBROUTINE CERRBD( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     December 22, 1999
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  CERRBD tests the error exits for ccgebrd, ccungbr, ccunmbr, and ccbdsqr.
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
      PARAMETER          ( NMAX = 4, LW = NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J, NT
*     ..
*     .. Local Arrays ..
      REAL               D( NMAX ), E( NMAX ), RW( 4*NMAX )
      COMPLEX            A( NMAX, NMAX ), TP( NMAX ), TQ( NMAX ),
     $                   U( NMAX, NMAX ), V( NMAX, NMAX ), W( LW )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ccbdsqr, ccgebd2, ccgebrd, CHKXER, ccungbr, ccunmbr
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
      OK = .TRUE.
      NT = 0
*
*     Test error exits of the SVD routines.
*
      IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        ccgebrd
*
         SRNAMT = 'ccgebrd'
         INFOT = 1
         CALL ccgebrd( -1, 0, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'ccgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgebrd( 0, -1, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'ccgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgebrd( 2, 1, A, 1, D, E, TQ, TP, W, 2, INFO )
         CALL CHKXER( 'ccgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgebrd( 2, 1, A, 2, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'ccgebrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        ccungbr
*
         SRNAMT = 'ccungbr'
         INFOT = 1
         CALL ccungbr( '/', 0, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccungbr( 'Q', -1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccungbr( 'Q', 0, -1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccungbr( 'Q', 0, 1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccungbr( 'Q', 1, 0, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccungbr( 'P', 1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccungbr( 'P', 0, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccungbr( 'Q', 0, 0, -1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccungbr( 'Q', 2, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccungbr( 'Q', 2, 2, 1, A, 2, TQ, W, 1, INFO )
         CALL CHKXER( 'ccungbr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        ccunmbr
*
         SRNAMT = 'ccunmbr'
         INFOT = 1
         CALL ccunmbr( '/', 'L', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccunmbr( 'Q', '/', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccunmbr( 'Q', 'L', '/', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccunmbr( 'Q', 'L', 'C', -1, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmbr( 'Q', 'L', 'C', 0, -1, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccunmbr( 'Q', 'L', 'C', 0, 0, -1, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmbr( 'Q', 'L', 'C', 2, 0, 0, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmbr( 'Q', 'R', 'C', 0, 2, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmbr( 'P', 'L', 'C', 2, 0, 2, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmbr( 'P', 'R', 'C', 0, 2, 2, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccunmbr( 'Q', 'R', 'C', 2, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccunmbr( 'Q', 'L', 'C', 0, 2, 0, A, 1, TQ, U, 1, W, 0,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccunmbr( 'Q', 'R', 'C', 2, 0, 0, A, 1, TQ, U, 2, W, 0,
     $                INFO )
         CALL CHKXER( 'ccunmbr', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        ccbdsqr
*
         SRNAMT = 'ccbdsqr'
         INFOT = 1
         CALL ccbdsqr( '/', 0, 0, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccbdsqr( 'U', -1, 0, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccbdsqr( 'U', 0, -1, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccbdsqr( 'U', 0, 0, -1, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccbdsqr( 'U', 0, 0, 0, -1, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccbdsqr( 'U', 2, 1, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccbdsqr( 'U', 0, 0, 2, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccbdsqr( 'U', 2, 0, 0, 1, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'ccbdsqr', INFOT, NOUT, LERR, OK )
         NT = NT + 8
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
     $        I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ',
     $        'exits ***' )
*
      RETURN
*
*     End of CERRBD
*
      END
