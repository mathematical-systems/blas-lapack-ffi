      SUBROUTINE ZERREC( PATH, NUNIT )
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
*  ZERREC tests the error exits for the routines for eigen- condition
*  estimation for DOUBLE PRECISION matrices:
*     cztrsyl, cctrexc, cctrsna and cctrsen.
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
      PARAMETER          ( NMAX = 4, LW = NMAX*( NMAX+2 ) )
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( ONE = 1.0D0, ZERO = 0.0D0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, IFST, ILST, INFO, J, M, NT
      DOUBLE PRECISION   SCALE
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      DOUBLE PRECISION   RW( LW ), S( NMAX ), SEP( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), B( NMAX, NMAX ),
     $                   C( NMAX, NMAX ), WORK( LW ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           CHKXER, cztrexc, cztrsen, cztrsna, cztrsyl
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
*     Test cztrsyl
*
      SRNAMT = 'cztrsyl'
      INFOT = 1
      CALL cztrsyl( 'X', 'N', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cztrsyl( 'N', 'X', 1, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL cztrsyl( 'N', 'N', 0, 0, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cztrsyl( 'N', 'N', 1, -1, 0, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL cztrsyl( 'N', 'N', 1, 0, -1, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cztrsyl( 'N', 'N', 1, 2, 0, A, 1, B, 1, C, 2, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 9
      CALL cztrsyl( 'N', 'N', 1, 0, 2, A, 1, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      INFOT = 11
      CALL cztrsyl( 'N', 'N', 1, 2, 0, A, 2, B, 1, C, 1, SCALE, INFO )
      CALL CHKXER( 'cztrsyl', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cztrexc
*
      SRNAMT = 'cztrexc'
      IFST = 1
      ILST = 1
      INFOT = 1
      CALL cztrexc( 'X', 1, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL cztrexc( 'N', 0, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 4
      ILST = 2
      CALL cztrexc( 'N', 2, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cztrexc( 'V', 2, A, 2, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 0
      ILST = 1
      CALL cztrexc( 'V', 1, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 7
      IFST = 2
      CALL cztrexc( 'V', 1, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      IFST = 1
      ILST = 0
      CALL cztrexc( 'V', 1, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      INFOT = 8
      ILST = 2
      CALL cztrexc( 'V', 1, A, 1, B, 1, IFST, ILST, INFO )
      CALL CHKXER( 'cztrexc', INFOT, NOUT, LERR, OK )
      NT = NT + 8
*
*     Test cztrsna
*
      SRNAMT = 'cztrsna'
      INFOT = 1
      CALL cztrsna( 'X', 'A', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cztrsna( 'B', 'X', SEL, 0, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cztrsna( 'B', 'A', SEL, -1, A, 1, B, 1, C, 1, S, SEP, 1, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cztrsna( 'V', 'A', SEL, 2, A, 1, B, 1, C, 1, S, SEP, 2, M,
     $             WORK, 2, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cztrsna( 'B', 'A', SEL, 2, A, 2, B, 1, C, 2, S, SEP, 2, M,
     $             WORK, 2, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL cztrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 1, S, SEP, 2, M,
     $             WORK, 2, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cztrsna( 'B', 'A', SEL, 1, A, 1, B, 1, C, 1, S, SEP, 0, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 13
      CALL cztrsna( 'B', 'S', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 1, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      INFOT = 16
      CALL cztrsna( 'B', 'A', SEL, 2, A, 2, B, 2, C, 2, S, SEP, 2, M,
     $             WORK, 1, RW, INFO )
      CALL CHKXER( 'cztrsna', INFOT, NOUT, LERR, OK )
      NT = NT + 9
*
*     Test cztrsen
*
      SEL( 1 ) = .FALSE.
      SRNAMT = 'cztrsen'
      INFOT = 1
      CALL cztrsen('X', 'N', SEL, 0, A, 1, B, 1, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 1, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL cztrsen('N', 'X', SEL, 0, A, 1, B, 1, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 1, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL cztrsen( 'N', 'N', SEL, -1, A, 1, B, 1, X, M, S( 1 ),
     $             SEP( 1 ), WORK, 1, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 6
      CALL cztrsen('N', 'N', SEL, 2, A, 1, B, 1, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 2, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL cztrsen('N', 'V', SEL, 2, A, 2, B, 1, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 1, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 14
      CALL cztrsen('N', 'V', SEL, 2, A, 2, B, 2, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 0, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 14
      CALL cztrsen('E', 'V', SEL, 3, A, 3, B, 3, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 1, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      INFOT = 14
      CALL cztrsen('V', 'V', SEL, 3, A, 3, B, 3, X, M, S( 1 ), SEP( 1 ),
     $             WORK, 3, INFO )
      CALL CHKXER( 'cztrsen', INFOT, NOUT, LERR, OK )
      NT = NT + 8
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
      RETURN
*
*     End of ZERREC
*
      END
