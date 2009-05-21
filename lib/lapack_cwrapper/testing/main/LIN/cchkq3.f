      SUBROUTINE CCHKQ3( DOTYPE, NM, MVAL, NN, NVAL, NNB, NBVAL, NXVAL,
     $                   THRESH, A, COPYA, S, COPYS, TAU, WORK, RWORK,
     $                   IWORK, NOUT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      INTEGER            NM, NN, NNB, NOUT
      REAL               THRESH
*     ..
*     .. Array Arguments ..
      LOGICAL            DOTYPE( * )
      INTEGER            IWORK( * ), MVAL( * ), NBVAL( * ), NVAL( * ),
     $                   NXVAL( * )
      REAL               COPYS( * ), RWORK( * ), S( * )
      COMPLEX            A( * ), COPYA( * ), TAU( * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  CCHKQ3 tests ccgeqp3.
*
*  Arguments
*  =========
*
*  DOTYPE  (input) LOGICAL array, dimension (NTYPES)
*          The matrix types to be used for testing.  Matrices of type j
*          (for 1 <= j <= NTYPES) are used for testing if DOTYPE(j) =
*          .TRUE.; if DOTYPE(j) = .FALSE., then type j is not used.
*
*  NM      (input) INTEGER
*          The number of values of M contained in the vector MVAL.
*
*  MVAL    (input) INTEGER array, dimension (NM)
*          The values of the matrix row dimension M.
*
*  NN      (input) INTEGER
*          The number of values of N contained in the vector NVAL.
*
*  NVAL    (input) INTEGER array, dimension (NN)
*          The values of the matrix column dimension N.
*
*  NNB     (input) INTEGER
*          The number of values of NB and NX contained in the
*          vectors NBVAL and NXVAL.  The blocking parameters are used
*          in pairs (NB,NX).
*
*  NBVAL   (input) INTEGER array, dimension (NNB)
*          The values of the blocksize NB.
*
*  NXVAL   (input) INTEGER array, dimension (NNB)
*          The values of the crossover point NX.
*
*  THRESH  (input) REAL
*          The threshold value for the test ratios.  A result is
*          included in the output file if RESULT >= THRESH.  To have
*          every test ratio printed, use THRESH = 0.
*
*  A       (workspace) COMPLEX array, dimension (MMAX*NMAX)
*          where MMAX is the maximum value of M in MVAL and NMAX is the
*          maximum value of N in NVAL.
*
*  COPYA   (workspace) COMPLEX array, dimension (MMAX*NMAX)
*
*  S       (workspace) REAL array, dimension
*                      (min(MMAX,NMAX))
*
*  COPYS   (workspace) REAL array, dimension
*                      (min(MMAX,NMAX))
*
*  TAU     (workspace) COMPLEX array, dimension (MMAX)
*
*  WORK    (workspace) COMPLEX array, dimension
*                      (max(M*max(M,N) + 4*min(M,N) + max(M,N)))
*
*  RWORK   (workspace) REAL array, dimension (4*NMAX)
*
*  IWORK   (workspace) INTEGER array, dimension (2*NMAX)
*
*  NOUT    (input) INTEGER
*          The unit number for output.
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            NTYPES
      PARAMETER          ( NTYPES = 6 )
      INTEGER            NTESTS
      PARAMETER          ( NTESTS = 3 )
      REAL               ONE, ZERO
      COMPLEX            CZERO
      PARAMETER          ( ONE = 1.0E+0, ZERO = 0.0E+0,
     $                   CZERO = ( 0.0E+0, 0.0E+0 ) )
*     ..
*     .. Local Scalars ..
      CHARACTER*3        PATH
      INTEGER            I, IHIGH, ILOW, IM, IMODE, IN, INB, INFO,
     $                   ISTEP, K, LDA, LW, LWORK, M, MNMIN, MODE, N,
     $                   NB, NERRS, NFAIL, NRUN, NX
      REAL               EPS
*     ..
*     .. Local Arrays ..
      INTEGER            ISEED( 4 ), ISEEDY( 4 )
      REAL               RESULT( NTESTS )
*     ..
*     .. External Functions ..
      REAL               CQPT01, CQRT11, CQRT12, SLAMCH
      EXTERNAL           CQPT01, CQRT11, CQRT12, SLAMCH
*     ..
*     .. External Subroutines ..
      EXTERNAL         ALAHD, ALASUM, ccgeqp3, cclacpy, cclaset, CLATMS,
     $                   ICOPY, SLAORD, XLAENV
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          MAX, MIN
*     ..
*     .. Scalars in Common ..
      LOGICAL            LERR, OK
      CHARACTER*7        SRNAMT
      INTEGER            INFOT, IOUNIT
*     ..
*     .. Common blocks ..
      COMMON             / INFOC / INFOT, IOUNIT, OK, LERR
      COMMON             / SRNAMC / SRNAMT
*     ..
*     .. Data statements ..
      DATA               ISEEDY / 1988, 1989, 1990, 1991 /
*     ..
*     .. Executable Statements ..
*
*     Initialize constants and the random number seed.
*
      PATH( 1: 1 ) = 'Complex precision'
      PATH( 2: 3 ) = 'Q3'
      NRUN = 0
      NFAIL = 0
      NERRS = 0
      DO 10 I = 1, 4
         ISEED( I ) = ISEEDY( I )
   10 CONTINUE
      EPS = SLAMCH( 'Epsilon' )
      INFOT = 0
*
      DO 90 IM = 1, NM
*
*        Do for each value of M in MVAL.
*
         M = MVAL( IM )
         LDA = MAX( 1, M )
*
         DO 80 IN = 1, NN
*
*           Do for each value of N in NVAL.
*
            N = NVAL( IN )
            MNMIN = MIN( M, N )
            LWORK = MAX( 1, M*MAX( M, N )+4*MNMIN+MAX( M, N ) )
*
            DO 70 IMODE = 1, NTYPES
               IF( .NOT.DOTYPE( IMODE ) )
     $            GO TO 70
*
*              Do for each type of matrix
*                 1:  zero matrix
*                 2:  one small singular value
*                 3:  geometric distribution of singular values
*                 4:  first n/2 columns fixed
*                 5:  last n/2 columns fixed
*                 6:  every second column fixed
*
               MODE = IMODE
               IF( IMODE.GT.3 )
     $            MODE = 1
*
*              Generate test matrix of size m by n using
*              singular value distribution indicated by `mode'.
*
               DO 20 I = 1, N
                  IWORK( I ) = 0
   20          CONTINUE
               IF( IMODE.EQ.1 ) THEN
                  CALL cclaset( 'Full', M, N, CZERO, CZERO, COPYA, LDA )
                  DO 30 I = 1, MNMIN
                     COPYS( I ) = ZERO
   30             CONTINUE
               ELSE
                  CALL CLATMS( M, N, 'Uniform', ISEED, 'Nonsymm', COPYS,
     $                         MODE, ONE / EPS, ONE, M, N, 'No packing',
     $                         COPYA, LDA, WORK, INFO )
                  IF( IMODE.GE.4 ) THEN
                     IF( IMODE.EQ.4 ) THEN
                        ILOW = 1
                        ISTEP = 1
                        IHIGH = MAX( 1, N / 2 )
                     ELSE IF( IMODE.EQ.5 ) THEN
                        ILOW = MAX( 1, N / 2 )
                        ISTEP = 1
                        IHIGH = N
                     ELSE IF( IMODE.EQ.6 ) THEN
                        ILOW = 1
                        ISTEP = 2
                        IHIGH = N
                     END IF
                     DO 40 I = ILOW, IHIGH, ISTEP
                        IWORK( I ) = 1
   40                CONTINUE
                  END IF
                  CALL SLAORD( 'Decreasing', MNMIN, COPYS, 1 )
               END IF
*
               DO 60 INB = 1, NNB
*
*                 Do for each pair of values (NB,NX) in NBVAL and NXVAL.
*
                  NB = NBVAL( INB )
                  CALL XLAENV( 1, NB )
                  NX = NXVAL( INB )
                  CALL XLAENV( 3, NX )
*
*                 Save A and its singular values and a copy of
*                 vector IWORK.
*
                  CALL cclacpy( 'All', M, N, COPYA, LDA, A, LDA )
                  CALL ICOPY( N, IWORK( 1 ), 1, IWORK( N+1 ), 1 )
*
*                 Workspace needed.
*
                  LW = NB*( N+1 )
*
                  SRNAMT = 'ccgeqp3'
                  CALL ccgeqp3( M, N, A, LDA, IWORK( N+1 ), TAU, WORK,
     $                         LW, RWORK, INFO )
*
*                 Compute norm(svd(a) - svd(r))
*
                  RESULT( 1 ) = CQRT12( M, N, A, LDA, COPYS, WORK,
     $                          LWORK, RWORK )
*
*                 Compute norm( A*P - Q*R )
*
                  RESULT( 2 ) = CQPT01( M, N, MNMIN, COPYA, A, LDA, TAU,
     $                          IWORK( N+1 ), WORK, LWORK )
*
*                 Compute Q'*Q
*
                  RESULT( 3 ) = CQRT11( M, MNMIN, A, LDA, TAU, WORK,
     $                          LWORK )
*
*                 Print information about the tests that did not pass
*                 the threshold.
*
                  DO 50 K = 1, NTESTS
                     IF( RESULT( K ).GE.THRESH ) THEN
                        IF( NFAIL.EQ.0 .AND. NERRS.EQ.0 )
     $                     CALL ALAHD( NOUT, PATH )
                        WRITE( NOUT, FMT = 9999 )'ccgeqp3', M, N, NB,
     $                     IMODE, K, RESULT( K )
                        NFAIL = NFAIL + 1
                     END IF
   50             CONTINUE
                  NRUN = NRUN + NTESTS
*
   60          CONTINUE
   70       CONTINUE
   80    CONTINUE
   90 CONTINUE
*
*     Print a summary of the results.
*
      CALL ALASUM( PATH, NOUT, NFAIL, NRUN, NERRS )
*
 9999 FORMAT( 1X, A6, ' M =', I5, ', N =', I5, ', NB =', I4, ', type ',
     $      I2, ', test ', I2, ', ratio =', G12.5 )
*
*     End of CCHKQ3
*
      END
