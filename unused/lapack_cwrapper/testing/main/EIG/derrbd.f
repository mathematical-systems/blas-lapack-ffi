      SUBROUTINE DERRBD( PATH, NUNIT )
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
*  DERRBD tests 
* the error exits for cdgebrd, cdorgbr, cdormbr, cdbdsqr and
*  cdbdsdc.
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
      INTEGER            IQ( NMAX, NMAX ), IW( NMAX )
      DOUBLE PRECISION   A( NMAX, NMAX ), D( NMAX ), E( NMAX ),
     $                   Q( NMAX, NMAX ), TP( NMAX ), TQ( NMAX ),
     $                   U( NMAX, NMAX ), V( NMAX, NMAX ), W( LW )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, cdbdsdc, cdbdsqr, cdgebd2, cdgebrd, cdorgbr,
     $                   cdormbr
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
*        cdgebrd
*
         SRNAMT = 'cdgebrd'
         INFOT = 1
         CALL cdgebrd( -1, 0, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'cdgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgebrd( 0, -1, A, 1, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'cdgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgebrd( 2, 1, A, 1, D, E, TQ, TP, W, 2, INFO )
         CALL CHKXER( 'cdgebrd', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdgebrd( 2, 1, A, 2, D, E, TQ, TP, W, 1, INFO )
         CALL CHKXER( 'cdgebrd', INFOT, NOUT, LERR, OK )
         NT = NT + 4
*
*        cdgebd2
*
         SRNAMT = 'cdgebd2'
         INFOT = 1
         CALL cdgebd2( -1, 0, A, 1, D, E, TQ, TP, W, INFO )
         CALL CHKXER( 'cdgebd2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgebd2( 0, -1, A, 1, D, E, TQ, TP, W, INFO )
         CALL CHKXER( 'cdgebd2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgebd2( 2, 1, A, 1, D, E, TQ, TP, W, INFO )
         CALL CHKXER( 'cdgebd2', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdorgbr
*
         SRNAMT = 'cdorgbr'
         INFOT = 1
         CALL cdorgbr( '/', 0, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdorgbr( 'Q', -1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorgbr( 'Q', 0, -1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorgbr( 'Q', 0, 1, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorgbr( 'Q', 1, 0, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorgbr( 'P', 1, 0, 0, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorgbr( 'P', 0, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdorgbr( 'Q', 0, 0, -1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdorgbr( 'Q', 2, 1, 1, A, 1, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdorgbr( 'Q', 2, 2, 1, A, 2, TQ, W, 1, INFO )
         CALL CHKXER( 'cdorgbr', INFOT, NOUT, LERR, OK )
         NT = NT + 10
*
*        cdormbr
*
         SRNAMT = 'cdormbr'
         INFOT = 1
         CALL cdormbr( '/', 'L', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdormbr( 'Q', '/', 'T', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdormbr( 'Q', 'L', '/', 0, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdormbr( 'Q', 'L', 'T', -1, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormbr( 'Q', 'L', 'T', 0, -1, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdormbr( 'Q', 'L', 'T', 0, 0, -1, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormbr( 'Q', 'L', 'T', 2, 0, 0, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormbr( 'Q', 'R', 'T', 0, 2, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormbr( 'P', 'L', 'T', 2, 0, 2, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormbr( 'P', 'R', 'T', 0, 2, 2, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdormbr( 'Q', 'R', 'T', 2, 0, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdormbr( 'Q', 'L', 'T', 0, 2, 0, A, 1, TQ, U, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdormbr( 'Q', 'R', 'T', 2, 0, 0, A, 1, TQ, U, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormbr', INFOT, NOUT, LERR, OK )
         NT = NT + 13
*
*        cdbdsqr
*
         SRNAMT = 'cdbdsqr'
         INFOT = 1
        CALL cdbdsqr( '/', 0, 0, 0, 0, D, E, V, 1, U, 1, A, 1, W, INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdbdsqr( 'U', -1, 0, 0, 0, D, E, V, 1, U, 1, A, 1, W,
     $                INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdbdsqr( 'U', 0, -1, 0, 0, D, E, V, 1, U, 1, A, 1, W,
     $                INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdbdsqr( 'U', 0, 0, -1, 0, D, E, V, 1, U, 1, A, 1, W,
     $                INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdbdsqr( 'U', 0, 0, 0, -1, D, E, V, 1, U, 1, A, 1, W,
     $                INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL cdbdsqr( 'U', 2, 1, 0, 0, D, E, V, 1, U, 1, A, 1, W, INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdbdsqr( 'U', 0, 0, 2, 0, D, E, V, 1, U, 1, A, 1, W, INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cdbdsqr( 'U', 2, 0, 0, 1, D, E, V, 1, U, 1, A, 1, W, INFO )
         CALL CHKXER( 'cdbdsqr', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cdbdsdc
*
         SRNAMT = 'cdbdsdc'
         INFOT = 1
         CALL cdbdsdc( '/', 'N', 0, D, E, U, 1, V, 1, Q, IQ, W, IW,
     $                INFO )
         CALL CHKXER( 'cdbdsdc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdbdsdc( 'U', '/', 0, D, E, U, 1, V, 1, Q, IQ, W, IW,
     $                INFO )
         CALL CHKXER( 'cdbdsdc', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdbdsdc( 'U', 'N', -1, D, E, U, 1, V, 1, Q, IQ, W, IW,
     $                INFO )
         CALL CHKXER( 'cdbdsdc', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdbdsdc( 'U', 'I', 2, D, E, U, 1, V, 1, Q, IQ, W, IW,
     $                INFO )
         CALL CHKXER( 'cdbdsdc', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdbdsdc( 'U', 'I', 2, D, E, U, 2, V, 1, Q, IQ, W, IW,
     $                INFO )
         CALL CHKXER( 'cdbdsdc', INFOT, NOUT, LERR, OK )
         NT = NT + 5
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
*     End of DERRBD
*
      END
