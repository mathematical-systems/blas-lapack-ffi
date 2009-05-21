      SUBROUTINE SERREC( PATH, NUNIT )
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
*  SERREC tests the error exits for the routines for eigen- condition
*  estimation for REAL matrices:
*     cstrsyl, cstrexc, cstrsna and cstrsen.
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
      REAL               ONE, ZERO
      PARAMETER          ( NMAX = 4, ONE = 1.0E0, ZERO = 0.0E0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, IFST, ILST, INFO, J, M, NT
      REAL               SCALE
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      INTEGER            IWORK( NMAX )
      REAL               A( NMAX, NMAX ), B( NMAX, NMAX ),
     $                   C( NMAX, NMAX ), S( NMAX ), SEP( NMAX ),
     $                   WI( NMAX ), WORK( NMAX ), WR( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           CHKXER, cstrexc, cstrsen, cstrsna, cstrsyl
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
*     Test cstrsyl
*
      SRNAMT = 'cstrsyl'
      INFOT = 1
      CALL cstrsyl( 'X', 'N', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cstrsyl( 'N', 'X', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL cstrsyl( 'N', 'N', 0, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cstrsyl( 'N', 'N', 1, -1, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL cstrsyl( 'N', 'N', 1, 0, -1, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cstrsyl( 'N', 'N', 1, 2, 0, A, 1, B, 1, C, 2, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 9
      CALL cstrsyl( 'N', 'N', 1, 0, 2, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 11
      CALL cstrsyl( 'N', 'N', 1, 2, 0, A, 2, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cstrsyl', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cstrexc
*
      SRNAMT = 'cstrexc'
      IFST = 1
      ILST = 1
      INFOT = 1
      CALL cstrexc( 'X', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cstrexc( 'N', 0, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 4
      ILST = 2
      CALL cstrexc( 'N', 2, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cstrexc( 'V', 2, A, 2, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 0
      ILST = 1
      CALL cstrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 2
      CALL cstrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      IFST = 1
      ILST = 0
      CALL cstrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      ILST = 2
      CALL cstrexc( 'V', 1, A, 1, B, 1, IFST, ILST, WORK, INFO )
      CALL CHKXER( 'cstrexc', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cstrsna
*
      SRNAMT = 'cstrsna'
      INFOT = 1
      CALL cstrsna( 'X', 'A', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cstrsna( 'B', 'X', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cstrsna( 'B', 'A', SEL, -1, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cstrsna( 'V', 'A', SEL, 2, A, 1, B, 1, C, 1, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cstrsna( 'B', 'A', SEL, 2, A, 2, B, 1, C, 2, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL cstrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 1, S, SEP, 2, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cstrsna( 'B', 'A', SEL, 1, A, 1, B, 1, C, 1, S, SEP, 0, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cstrsna( 'B', 'S', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 1, M,
     $             WORK, 2, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      INFOT = 16
      CALL cstrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 2, M,
     $             WORK, 1, IWORK, INFO )
      CALL CHKXER( 'cstrsna', INFOT, NOUT, LERR, OK )
      NT = NT + 9
*
*     Test cstrsen
*
      SEL( 1 ) = .FALSE.
      SRNAMT = 'cstrsen'
      INFOT = 1
      CALL cstrsen( 'X', 'N', SEL, 0, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cstrsen( 'N', 'X', SEL, 0, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cstrsen( 'N', 'N', SEL, -1, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cstrsen( 'N', 'N', SEL, 2, A, 1, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 2, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cstrsen( 'N', 'V', SEL, 2, A, 2, B, 1, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cstrsen( 'N', 'V', SEL, 2, A, 2, B, 2, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 0, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cstrsen( 'E', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 15
      CALL cstrsen( 'V', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 3, IWORK, 2, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 17
      CALL cstrsen( 'E', 'V', SEL, 2, A, 2, B, 2, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, IWORK, 0, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
      INFOT = 17
      CALL cstrsen( 'V', 'V', SEL, 3, A, 3, B, 3, WR, WI, M, S( 1 ),
     $             SEP( 1 ), WORK, 4, IWORK, 1, INFO )
      CALL CHKXER( 'cstrsen', INFOT, NOUT, LERR, OK )
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
*     End of SERREC
*
      END
