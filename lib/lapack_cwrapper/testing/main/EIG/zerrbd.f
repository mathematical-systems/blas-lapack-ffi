      SUBROUTINE ZERRBD( PATH, NUNIT )
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
*  ZERRBD tests the error exits for czgebrd, czungbr, czunmbr, and czbdsqr.
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
      DOUBLE PRECISION   D( NMAX ), E( NMAX ), RW( 4*NMAX )
      COMPLEX*16         A( NMAX, NMAX ), TP( NMAX ), TQ( NMAX ),
     $                   U( NMAX, NMAX ), V( NMAX, NMAX ), W( LW )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           CHKXER, czbdsqr, czgebrd, czungbr, czunmbr
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
      OK = .TRUE.
      NT = 0
*
*     Test error exits of the SVD routines.
*
      IF( LSAMEN( 2, C2, 'BD' ) ) THEN
*
*        czgebrd
*
         SRNAMT = 'czgebrd'
         INFOT = 1
         CALL czgebrd( -1, 0, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'czgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgebrd( 0, -1, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'czgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgebrd( 2, 1, A, 1, D, E, TQ, TP, W, 2, INFO )
         CALL CHKXER( 'czgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgebrd( 2, 1, A, 2, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'czgebrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        czungbr
*
         SRNAMT = 'czungbr'
         INFOT = 1
         CALL czungbr( '/', 0, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czungbr( 'Q', -1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czungbr( 'Q', 0, -1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czungbr( 'Q', 0, 1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czungbr( 'Q', 1, 0, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czungbr( 'P', 1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czungbr( 'P', 0, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czungbr( 'Q', 0, 0, -1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czungbr( 'Q', 2, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czungbr( 'Q', 2, 2, 1, A, 2, TQ, W, 1, INFO )
         CALL CHKXER( 'czungbr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        czunmbr
*
         SRNAMT = 'czunmbr'
         INFOT = 1
         CALL czunmbr( '/', 'L', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czunmbr( 'Q', '/', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czunmbr( 'Q', 'L', '/', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czunmbr( 'Q', 'L', 'C', -1, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czunmbr( 'Q', 'L', 'C', 0, -1, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czunmbr( 'Q', 'L', 'C', 0, 0, -1, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czunmbr( 'Q', 'L', 'C', 2, 0, 0, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czunmbr( 'Q', 'R', 'C', 0, 2, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czunmbr( 'P', 'L', 'C', 2, 0, 2, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czunmbr( 'P', 'R', 'C', 0, 2, 2, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czunmbr( 'Q', 'R', 'C', 2, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czunmbr( 'Q', 'L', 'C', 0, 2, 0, A, 1, TQ, U, 1, W, 0,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czunmbr( 'Q', 'R', 'C', 2, 0, 0, A, 1, TQ, U, 2, W, 0,
     $                INFO )
         CALL CHKXER( 'czunmbr', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        czbdsqr
*
         SRNAMT = 'czbdsqr'
         INFOT = 1
         CALL czbdsqr( '/', 0, 0, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czbdsqr( 'U', -1, 0, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czbdsqr( 'U', 0, -1, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czbdsqr( 'U', 0, 0, -1, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czbdsqr( 'U', 0, 0, 0, -1, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czbdsqr( 'U', 2, 1, 0, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czbdsqr( 'U', 0, 0, 2, 0, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czbdsqr( 'U', 2, 0, 0, 1, D, E, V, 1, U, 1, A, 1, RW,
     $                INFO )
         CALL CHKXER( 'czbdsqr', INFOT, NOUT, LERR, OK )
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
*     End of ZERRBD
*
      END
