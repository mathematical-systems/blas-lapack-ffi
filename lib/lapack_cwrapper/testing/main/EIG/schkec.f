      SUBROUTINE SCHKEC( THRESH, TSTERR, NIN, NOUT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      LOGICAL            TSTERR
      INTEGER            NIN, NOUT
      REAL               THRESH
*     ..
*
*  Purpose
*  =======
*
*  SCHKEC tests eigen- condition estimation routines
*         cslaln2, cslasy2, cslanv2, cslaqtr, cslaexc,
*         cstrsyl, cstrexc, cstrsna, cstrsen
*
*  In all cases, the routine runs through a fixed set of numerical
*  examples, subjects them to various tests, and compares the test
*  results to a threshold THRESH. In addition, cstrexc, cstrsna and cstrsen
*  are tested by reading in precomputed examples from a file (on input
*  unit NIN).  Output is written to output unit NOUT.
*
*  Arguments
*  =========
*
*  THRESH  (input) REAL
*          Threshold for residual tests.  A computed test ratio passes
*          the threshold if it is less than THRESH.
*
*  TSTERR  (input) LOGICAL
*          Flag that indicates whether error exits are to be tested.
*
*  NIN     (input) INTEGER
*          The logical unit number for input.
*
*  NOUT    (input) INTEGER
*          The logical unit number for output.
*
*  =====================================================================
*
*     .. Local Scalars ..
      LOGICAL            OK
      CHARACTER*3        PATH
      INTEGER            KLAEXC, KLALN2, KLANV2, KLAQTR, KLASY2, KTREXC,
     $                   KTRSEN, KTRSNA, KTRSYL, LLAEXC, LLALN2, LLANV2,
     $                   LLAQTR, LLASY2, LTREXC, LTRSYL, NLANV2, NLAQTR,
     $                   NLASY2, NTESTS, NTRSYL
      REAL               EPS, RLAEXC, RLALN2, RLANV2, RLAQTR, RLASY2,
     $                   RTREXC, RTRSYL, SFMIN
*     ..
*     .. Local Arrays ..
      INTEGER            LTRSEN( 3 ), LTRSNA( 3 ), NLAEXC( 2 ),
     $                   NLALN2( 2 ), NTREXC( 3 ), NTRSEN( 3 ),
     $                   NTRSNA( 3 )
      REAL               RTRSEN( 3 ), RTRSNA( 3 )
*     ..
*     .. External Subroutines ..
      EXTERNAL           SERREC, SGET31, SGET32, SGET33, SGET34, SGET35,
     $                   SGET36, SGET37, SGET38, SGET39
*     ..
*     .. External Functions ..
      REAL               SLAMCH
      EXTERNAL           SLAMCH
*     ..
*     .. Executable Statements ..
*
      PATH( 1: 1 ) = 'Single precision'
      PATH( 2: 3 ) = 'EC'
      EPS = SLAMCH( 'P' )
      SFMIN = SLAMCH( 'S' )
*
*     Print header information
*
      WRITE( NOUT, FMT = 9989 )
      WRITE( NOUT, FMT = 9988 )EPS, SFMIN
      WRITE( NOUT, FMT = 9987 )THRESH
*
*     Test error exits if TSTERR is .TRUE.
*
      IF( TSTERR )
     $   CALL SERREC( PATH, NOUT )
*
      OK = .TRUE.
      CALL SGET31( RLALN2, LLALN2, NLALN2, KLALN2 )
      IF( RLALN2.GT.THRESH .OR. NLALN2( 1 ).NE.0 ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9999 )RLALN2, LLALN2, NLALN2, KLALN2
      END IF
*
      CALL SGET32( RLASY2, LLASY2, NLASY2, KLASY2 )
      IF( RLASY2.GT.THRESH ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9998 )RLASY2, LLASY2, NLASY2, KLASY2
      END IF
*
      CALL SGET33( RLANV2, LLANV2, NLANV2, KLANV2 )
      IF( RLANV2.GT.THRESH .OR. NLANV2.NE.0 ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9997 )RLANV2, LLANV2, NLANV2, KLANV2
      END IF
*
      CALL SGET34( RLAEXC, LLAEXC, NLAEXC, KLAEXC )
      IF( RLAEXC.GT.THRESH .OR. NLAEXC( 2 ).NE.0 ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9996 )RLAEXC, LLAEXC, NLAEXC, KLAEXC
      END IF
*
      CALL SGET35( RTRSYL, LTRSYL, NTRSYL, KTRSYL )
      IF( RTRSYL.GT.THRESH ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9995 )RTRSYL, LTRSYL, NTRSYL, KTRSYL
      END IF
*
      CALL SGET36( RTREXC, LTREXC, NTREXC, KTREXC, NIN )
      IF( RTREXC.GT.THRESH .OR. NTREXC( 3 ).GT.0 ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9994 )RTREXC, LTREXC, NTREXC, KTREXC
      END IF
*
      CALL SGET37( RTRSNA, LTRSNA, NTRSNA, KTRSNA, NIN )
      IF( RTRSNA( 1 ).GT.THRESH .OR. RTRSNA( 2 ).GT.THRESH .OR.
     $    NTRSNA( 1 ).NE.0 .OR. NTRSNA( 2 ).NE.0 .OR. NTRSNA( 3 ).NE.0 )
     $     THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9993 )RTRSNA, LTRSNA, NTRSNA, KTRSNA
      END IF
*
      CALL SGET38( RTRSEN, LTRSEN, NTRSEN, KTRSEN, NIN )
      IF( RTRSEN( 1 ).GT.THRESH .OR. RTRSEN( 2 ).GT.THRESH .OR.
     $    NTRSEN( 1 ).NE.0 .OR. NTRSEN( 2 ).NE.0 .OR. NTRSEN( 3 ).NE.0 )
     $     THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9992 )RTRSEN, LTRSEN, NTRSEN, KTRSEN
      END IF
*
      CALL SGET39( RLAQTR, LLAQTR, NLAQTR, KLAQTR )
      IF( RLAQTR.GT.THRESH ) THEN
         OK = .FALSE.
         WRITE( NOUT, FMT = 9991 )RLAQTR, LLAQTR, NLAQTR, KLAQTR
      END IF
*
      NTESTS = KLALN2 + KLASY2 + KLANV2 + KLAEXC + KTRSYL + KTREXC +
     $         KTRSNA + KTRSEN + KLAQTR
      IF( OK )
     $   WRITE( NOUT, FMT = 9990 )PATH, NTESTS
*
      RETURN
 9999 FORMAT(' Error in cslaln2: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', 2I8, ' KNT=', I8 )
 9998 FORMAT(' Error in cslasy2: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', I8, ' KNT=', I8 )
 9997 FORMAT(' Error in cslanv2: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', I8, ' KNT=', I8 )
 9996 FORMAT(' Error in cslaexc: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', 2I8, ' KNT=', I8 )
 9995 FORMAT(' Error in cstrsyl: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', I8, ' KNT=', I8 )
 9994 FORMAT(' Error in cstrexc: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', 3I8, ' KNT=', I8 )
 9993 FORMAT( ' Error in cstrsna: RMAX =', 3E12.3, / ' LMAX = ', 3I8,
     $      ' NINFO=', 3I8, ' KNT=', I8 )
 9992 FORMAT( ' Error in cstrsen: RMAX =', 3E12.3, / ' LMAX = ', 3I8,
     $      ' NINFO=', 3I8, ' KNT=', I8 )
 9991 FORMAT(' Error in cslaqtr: RMAX =', E12.3, / ' LMAX = ', I8, ' N',
     $      'INFO=', I8, ' KNT=', I8 )
 9990 FORMAT( / 1X, 'All tests for ', A3, ' routines passed the thresh',
     $      'old (', I6, ' tests run)' )
 9989 FORMAT( ' Tests of the Nonsymmetric eigenproblem
     $      condition estim',
     $      'ation routines',
     $       / ' cslaln2, cslasy2, cslanv2, cslaexc, STRS',
     $      'YL, cstrexc, cstrsna, cstrsen, cslaqtr', / )
 9988 FORMAT( ' Relative machine precision (EPS) = ', E16.6, / ' Safe ',
     $      'minimum (SFMIN)             = ', E16.6, / )
 9987 FORMAT( ' Routines pass computational tests if test ratio is les',
     $      's than', F8.2, / / )
*
*     End of SCHKEC
*
      END
