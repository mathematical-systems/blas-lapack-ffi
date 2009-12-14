      SUBROUTINE DERREC( PATH, NUNIT )
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
*  DERREC tests the error exits for the routines for eigen- condition
*  estimation for DOUBLE PRECISION matrices:
*     cdtrsyl, cstrexc, cstrsna and cstrsen.
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
      INTEGER            NMAX
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( NMAX = 4, ONE = 1.0D0, ZERO = 0.0D0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, IFST, ILST, INFO, J, M, NT
      DOUBLE PRECISION   SCALE
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      INTEGER            IWORK( NMAX )
      DOUBLE PRECISION   A( NMAX, NMAX ), B( NMAX, NMAX ),
     $                   C( NMAX, NMAX ), S( NMAX ), SEP( NMAX ),
     $                   WI( NMAX ), WORK( NMAX ), WR( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           CHKXER, cdtrexc, cdtrsen, cdtrsna, cdtrsyl
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
      OK = .TRUE.
      NT = 0
*
*     Initialize A, B and SEL
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = ZERO
            B( I, J ) = ZERO
   10    CONTINUE
   20 CONTINUE
      DO 30 I = 1, NMAX
         A( I, I ) = ONE
         SEL( I ) = .TRUE.
   30 CONTINUE
*
*     Test cdtrsyl
*
      SRNAMT = 'cdtrsyl'
      INFOT = 1
      CALL cdtrsyl( 'X', 'N', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cdtrsyl( 'N', 'X', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL cdtrsyl( 'N', 'N', 0, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cdtrsyl( 'N', 'N', 1, -1, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL cdtrsyl( 'N', 'N', 1, 0, -1, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cdtrsyl( 'N', 'N', 1, 2, 0, A, 1, B, 1, C, 2, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 9
      CALL cdtrsyl( 'N', 'N', 1, 0, 2, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 11
      CALL cdtrsyl( 'N', 'N', 1, 2, 0, A, 2, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cdtrsyl', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cdtrexc
*
      SRNAMT = 'cdtrexc'
      IFST = 1
      ILST = 1
      INFOT = 1
      CALL cdtrexc( 'X', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cdtrexc( 'N', 0, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 4
      ILST = 2
      CALL cdtrexc( 'N', 2, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cdtrexc( 'V', 2, A, 2, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 0
      ILST = 1
      CALL cdtrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 2
      CALL cdtrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      IFST = 1
      ILST = 0
      CALL cdtrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      ILST = 2
      CALL cdtrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cdtrexc', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cdtrsna
*
      SRNAMT = 'cdtrsna'
      INFOT = 1
      CALL cdtrsna( 'X', 'A', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cdtrsna( 'B', 'X', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cdtrsna( 'B', 'A', SEL, -1, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cdtrsna( 'V', 'A', SEL, 2, A, 1, B, 1, C, 1, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cdtrsna( 'B', 'A', SEL, 2, A, 2, B, 1, C, 2, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL cdtrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 1, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cdtrsna( 'B', 'A', SEL, 1, A, 1, B, 1, C, 1, S, SEP, 0, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cdtrsna( 'B', 'S', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 1, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      INFOT = 16
      CALL cdtrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 2, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cdtrsna', INFOT, NOUT, LERR, OK )
      NT = NT + 9
*
*     Test cdtrsen
*
      SEL( 1 ) = .FALSE.
      SRNAMT = 'cdtrsen'
      INFOT = 1
      CALL cdtrsen( 'X', 'N', SEL, 0, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cdtrsen( 'N', 'X', SEL, 0, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cdtrsen( 'N', 'N', SEL, -1, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cdtrsen( 'N', 'N', SEL, 2, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 2, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cdtrsen( 'N', 'V', SEL, 2, A, 2, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cdtrsen( 'N', 'V', SEL, 2, A, 2, B, 2, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 0, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cdtrsen( 'E', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cdtrsen( 'V', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 3, IWORK, 2, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 17
      CALL cdtrsen( 'E', 'V', SEL, 2, A, 2, B, 2, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 0, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      INFOT = 17
      CALL cdtrsen( 'V', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 4, IWORK, 1, INFO )
      CALL CHKXER( 'cdtrsen', INFOT, NOUT, LERR, OK )
      NT = NT + 10
*
*     Print a summary line.
*
      IF( OK ) THEN
         WRITE( NOUT, FMT = 9999 )PATH, NT
      ELSE
         WRITE( NOUT, FMT = 9998 )PATH
      END IF
*
      RETURN
 9999 FORMAT( 1X, A3, ' routines passed the tests of the error exits (',
     $      I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ex',
     $      'its ***' )
*
*     End of DERREC
*
      END
