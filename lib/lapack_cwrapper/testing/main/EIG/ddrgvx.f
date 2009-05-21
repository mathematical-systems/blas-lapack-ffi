      SUBROUTINE DDRGVX( NSIZE, THRESH, NIN, NOUT, A, LDA, B, AI, BI,
     $                   ALPHAR, ALPHAI, BETA, VL, VR, ILO, IHI, LSCALE,
     $                   RSCALE, S, DTRU, DIF, DIFTRU, WORK, LWORK,
     $                   IWORK, LIWORK, RESULT, BWORK, INFO )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      INTEGER            IHI, ILO, INFO, LDA, LIWORK, LWORK, NIN, NOUT,
     $                   NSIZE
      DOUBLE PRECISION   THRESH
*     ..
*     .. Array Arguments ..
      LOGICAL            BWORK( * )
      INTEGER            IWORK( * )
      DOUBLE PRECISION   A( LDA, * ), AI( LDA, * ), ALPHAI( * ),
     $                   ALPHAR( * ), B( LDA, * ), BETA( * ),
     $                   BI( LDA, * ), DIF( * ), DIFTRU( * ), DTRU( * ),
     $                   LSCALE( * ), RESULT( 4 ), RSCALE( * ), S( * ),
     $                   VL( LDA, * ), VR( LDA, * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  DDRGVX checks the nonsymmetric generalized eigenvalue problem
*  expert driver cdggevX.
*
*  cdggevX computes the generalized eigenvalues, (optionally) the left
*  and/or right eigenvectors, (optionally) computes a balancing
*  transformation to improve the conditioning, and (optionally)
*  reciprocal condition numbers for the eigenvalues and eigenvectors.
*
*  When DDRGVX is called with NSIZE > 0, two types of test matrix pairs
*  are generated by the subroutine DLATM6 and test the driver cdggevX.
*  The test matrices have the known exact condition numbers for
*  eigenvalues. For the condition numbers of the eigenvectors
*  corresponding the first and last eigenvalues are also know
*  ``exactly'' (see DLATM6).
*
*  For each matrix pair, the following tests will be performed and
*  compared with the threshhold THRESH.
*
*  (1) max over all left eigenvalue/-vector pairs (beta/alpha,l) of
*
*     | l**H * (beta A - alpha B) | / ( ulp max( |beta A|, |alpha B| ) )
*
*      where l**H is the conjugate tranpose of l.
*
*  (2) max over all right eigenvalue/-vector pairs (beta/alpha,r) of
*
*        | (beta A - alpha B) r | / ( ulp max( |beta A|, |alpha B| ) )
*
*  (3) The condition number S(i) of eigenvalues computed by cdggevX
*      differs less than a factor THRESH from the exact S(i) (see
*      DLATM6).
*
*  (4) DIF(i) computed by cdtgsna differs less than a factor 10*THRESH
*      from the exact value (for the 1st and 5th vectors only).
*
*  Test Matrices
*  =============
*
*  Two kinds of test matrix pairs
*
*           (A, B) = inverse(YH) * (Da, Db) * inverse(X)
*
*  are used in the tests:
*
*  1: Da = 1+a   0    0    0    0    Db = 1   0   0   0   0
*           0   2+a   0    0    0         0   1   0   0   0
*           0    0   3+a   0    0         0   0   1   0   0
*           0    0    0   4+a   0         0   0   0   1   0
*           0    0    0    0   5+a ,      0   0   0   0   1 , and
*
*  2: Da =  1   -1    0    0    0    Db = 1   0   0   0   0
*           1    1    0    0    0         0   1   0   0   0
*           0    0    1    0    0         0   0   1   0   0
*           0    0    0   1+a  1+b        0   0   0   1   0
*           0    0    0  -1-b  1+a ,      0   0   0   0   1 .
*
*  In both cases the same inverse(YH) and inverse(X) are used to compute
*  (A, B), giving the exact eigenvectors to (A,B) as (YH, X):
*
*  YH:  =  1    0   -y    y   -y    X =  1   0  -x  -x   x
*          0    1   -y    y   -y         0   1   x  -x  -x
*          0    0    1    0    0         0   0   1   0   0
*          0    0    0    1    0         0   0   0   1   0
*          0    0    0    0    1,        0   0   0   0   1 , where
*
*  a, b, x and y will have all values independently of each other from
*  { sqrt(sqrt(ULP)),  0.1,  1,  10,  1/sqrt(sqrt(ULP)) }.
*
*  Arguments
*  =========
*
*  NSIZE   (input) INTEGER
*          The number of sizes of matrices to use.  NSIZE must be at
*          least zero. If it is zero, no randomly generated matrices
*          are tested, but any test matrices read from NIN will be
*          tested.
*
*  THRESH  (input) DOUBLE PRECISION
*          A test will count as "failed" if the "error", computed as
*          described above, exceeds THRESH.  Note that the error
*          is scaled to be O(1), so THRESH should be a reasonably
*          small multiple of 1, e.g., 10 or 100.  In particular,
*          it should not depend on the precision (single vs. double)
*          or the size of the matrix.  It must be at least zero.
*
*  NIN     (input) INTEGER
*          The FORTRAN unit number for reading in the data file of
*          problems to solve.
*
*  NOUT    (input) INTEGER
*          The FORTRAN unit number for printing out error messages
*          (e.g., if a routine returns IINFO not equal to 0.)
*
*  A       (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          Used to hold the matrix whose eigenvalues are to be
*          computed.  On exit, A contains the last matrix actually used.
*
*  LDA     (input) INTEGER
*          The leading dimension of A, B, AI, BI, Ao, and Bo.
*          It must be at least 1 and at least NSIZE.
*
*  B       (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          Used to hold the matrix whose eigenvalues are to be
*          computed.  On exit, B contains the last matrix actually used.
*
*  AI      (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          Copy of A, modified by cdggevX.
*
*  BI      (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          Copy of B, modified by cdggevX.
*
*  ALPHAR  (workspace) DOUBLE PRECISION array, dimension (NSIZE)
*  ALPHAI  (workspace) DOUBLE PRECISION array, dimension (NSIZE)
*  BETA    (workspace) DOUBLE PRECISION array, dimension (NSIZE)
*          On exit, (ALPHAR + ALPHAI*i)/BETA are the eigenvalues.
*
*  VL      (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          VL holds the left eigenvectors computed by cdggevX.
*
*  VR      (workspace) DOUBLE PRECISION array, dimension (LDA, NSIZE)
*          VR holds the right eigenvectors computed by cdggevX.
*
*  ILO     (output/workspace) INTEGER
*
*  IHI     (output/workspace) INTEGER
*
*  LSCALE  (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  RSCALE  (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  S       (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  DTRU    (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  DIF     (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  DIFTRU  (output/workspace) DOUBLE PRECISION array, dimension (N)
*
*  WORK    (workspace) DOUBLE PRECISION array, dimension (LWORK)
*
*  LWORK   (input) INTEGER
*          Leading dimension of WORK.  LWORK >= 2*N*N+12*N+16.
*
*  IWORK   (workspace) INTEGER array, dimension (LIWORK)
*
*  LIWORK  (input) INTEGER
*          Leading dimension of IWORK.  Must be at least N+6.
*
*  RESULT  (output/workspace) DOUBLE PRECISION array, dimension (4)
*
*  BWORK   (workspace) LOGICAL array, dimension (N)
*
*  INFO    (output) INTEGER
*          = 0:  successful exit
*          < 0:  if INFO = -i, the i-th argument had an illegal value.
*          > 0:  A routine returned an error code.
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ZERO, ONE, TEN, TNTH
      PARAMETER          ( ZERO = 0.0D+0, ONE = 1.0D+0, TEN = 1.0D+1,
     $                   TNTH = 1.0D-1 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, IPTYPE, IWA, IWB, IWX, IWY, J, LINFO,
     $                   MAXWRK, MINWRK, N, NERRS, NMAX, NPTKNT, NTESTT
      DOUBLE PRECISION   ABNORM, ANORM, BNORM, RATIO1, RATIO2, THRSH2,
     $                   ULP, ULPINV
*     ..
*     .. Local Arrays ..
      DOUBLE PRECISION   WEIGHT( 5 )
*     ..
*     .. External Functions ..
      INTEGER            ILAENV
      DOUBLE PRECISION   DLAMCH, DLANGE
      EXTERNAL           ILAENV, DLAMCH, DLANGE
*     ..
*     .. External Subroutines ..
      EXTERNAL         ALASVM, DGET52, cdggevX, cdlacpy, DLATM6, xerbla
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, MAX, SQRT
*     ..
*     .. Executable Statements ..
*
*     Check for errors
*
      INFO = 0
*
      NMAX = 5
*
      IF( NSIZE.LT.0 ) THEN
         INFO = -1
      ELSE IF( THRESH.LT.ZERO ) THEN
         INFO = -2
      ELSE IF( NIN.LE.0 ) THEN
         INFO = -3
      ELSE IF( NOUT.LE.0 ) THEN
         INFO = -4
      ELSE IF( LDA.LT.1 .OR. LDA.LT.NMAX ) THEN
         INFO = -6
      ELSE IF( LIWORK.LT.NMAX+6 ) THEN
         INFO = -26
      END IF
*
*     Compute workspace
*      (Note: Comments in the code beginning "Workspace:" describe the
*       minimal amount of workspace needed at that point in the code,
*       as well as the preferred amount for good performance.
*       NB refers to the optimal block size for the immediately
*       following subroutine, as returned by ILAENV.)
*
      MINWRK = 1
      IF( INFO.EQ.0 .AND. LWORK.GE.1 ) THEN
         MINWRK = 2*NMAX*NMAX + 12*NMAX + 16
        MAXWRK = 6*NMAX + NMAX*ILAENV( 1, 'cdgeqrf', ' ', NMAX, 1, NMAX,
     $            0 )
         MAXWRK = MAX( MAXWRK, 2*NMAX*NMAX+12*NMAX+16 )
         WORK( 1 ) = MAXWRK
      END IF
*
      IF( LWORK.LT.MINWRK )
     $   INFO = -24
*
      IF( INFO.NE.0 ) THEN
         CALL xerbla( 'DDRGVX', -INFO )
         RETURN
      END IF
*
      N = 5
      ULP = DLAMCH( 'P' )
      ULPINV = ONE / ULP
      THRSH2 = TEN*THRESH
      NERRS = 0
      NPTKNT = 0
      NTESTT = 0
*
      IF( NSIZE.EQ.0 )
     $   GO TO 90
*
*     Parameters used for generating test matrices.
*
      WEIGHT( 1 ) = SQRT( SQRT( ULP ) )
      WEIGHT( 2 ) = TNTH
      WEIGHT( 3 ) = ONE
      WEIGHT( 4 ) = ONE / WEIGHT( 2 )
      WEIGHT( 5 ) = ONE / WEIGHT( 1 )
*
      DO 80 IPTYPE = 1, 2
         DO 70 IWA = 1, 5
            DO 60 IWB = 1, 5
               DO 50 IWX = 1, 5
                  DO 40 IWY = 1, 5
*
*                    generated a test matrix pair
*
                     CALL DLATM6( IPTYPE, 5, A, LDA, B, VR, LDA, VL,
     $                            LDA, WEIGHT( IWA ), WEIGHT( IWB ),
     $                            WEIGHT( IWX ), WEIGHT( IWY ), DTRU,
     $                            DIFTRU )
*
*                    Compute eigenvalues/eigenvectors of (A, B).
*                    Compute eigenvalue/eigenvector condition numbers
*                    using computed eigenvectors.
*
                     CALL cdlacpy( 'F', N, N, A, LDA, AI, LDA )
                     CALL cdlacpy( 'F', N, N, B, LDA, BI, LDA )
*
                     CALL cdggevX( 'N', 'V', 'V', 'B', N, AI, LDA, BI,
     $                            LDA, ALPHAR, ALPHAI, BETA, VL, LDA,
     $                            VR, LDA, ILO, IHI, LSCALE, RSCALE,
     $                            ANORM, BNORM, S, DIF, WORK, LWORK,
     $                            IWORK, BWORK, LINFO )
                     IF( LINFO.NE.0 ) THEN
                        RESULT( 1 ) = ULPINV
                        WRITE( NOUT, FMT = 9999 )'cdggevX', LINFO, N,
     $                     IPTYPE
                        GO TO 30
                     END IF
*
*                    Compute the norm(A, B)
*
                     CALL cdlacpy( 'Full', N, N, AI, LDA, WORK, N )
                     CALL cdlacpy( 'Full', N, N, BI, LDA, WORK( N*N+1 ),
     $                            N )
                     ABNORM = DLANGE( 'Fro', N, 2*N, WORK, N, WORK )
*
*                    Tests (1) and (2)
*
                     RESULT( 1 ) = ZERO
                     CALL DGET52( .TRUE., N, A, LDA, B, LDA, VL, LDA,
     $                            ALPHAR, ALPHAI, BETA, WORK,
     $                            RESULT( 1 ) )
                     IF( RESULT( 2 ).GT.THRESH ) THEN
                        WRITE( NOUT, FMT = 9998 )'Left', 'cdggevX',
     $                     RESULT( 2 ), N, IPTYPE, IWA, IWB, IWX, IWY
                     END IF
*
                     RESULT( 2 ) = ZERO
                     CALL DGET52( .FALSE., N, A, LDA, B, LDA, VR, LDA,
     $                            ALPHAR, ALPHAI, BETA, WORK,
     $                            RESULT( 2 ) )
                     IF( RESULT( 3 ).GT.THRESH ) THEN
                        WRITE( NOUT, FMT = 9998 )'Right', 'cdggevX',
     $                     RESULT( 3 ), N, IPTYPE, IWA, IWB, IWX, IWY
                     END IF
*
*                    Test (3)
*
                     RESULT( 3 ) = ZERO
                     DO 10 I = 1, N
                        IF( S( I ).EQ.ZERO ) THEN
                           IF( DTRU( I ).GT.ABNORM*ULP )
     $                        RESULT( 3 ) = ULPINV
                        ELSE IF( DTRU( I ).EQ.ZERO ) THEN
                           IF( S( I ).GT.ABNORM*ULP )
     $                        RESULT( 3 ) = ULPINV
                        ELSE
                           WORK( I ) = MAX( ABS( DTRU( I ) / S( I ) ),
     $                                 ABS( S( I ) / DTRU( I ) ) )
                           RESULT( 3 ) = MAX( RESULT( 3 ), WORK( I ) )
                        END IF
   10                CONTINUE
*
*                    Test (4)
*
                     RESULT( 4 ) = ZERO
                     IF( DIF( 1 ).EQ.ZERO ) THEN
                        IF( DIFTRU( 1 ).GT.ABNORM*ULP )
     $                     RESULT( 4 ) = ULPINV
                     ELSE IF( DIFTRU( 1 ).EQ.ZERO ) THEN
                        IF( DIF( 1 ).GT.ABNORM*ULP )
     $                     RESULT( 4 ) = ULPINV
                     ELSE IF( DIF( 5 ).EQ.ZERO ) THEN
                        IF( DIFTRU( 5 ).GT.ABNORM*ULP )
     $                     RESULT( 4 ) = ULPINV
                     ELSE IF( DIFTRU( 5 ).EQ.ZERO ) THEN
                        IF( DIF( 5 ).GT.ABNORM*ULP )
     $                     RESULT( 4 ) = ULPINV
                     ELSE
                        RATIO1 = MAX( ABS( DIFTRU( 1 ) / DIF( 1 ) ),
     $                           ABS( DIF( 1 ) / DIFTRU( 1 ) ) )
                        RATIO2 = MAX( ABS( DIFTRU( 5 ) / DIF( 5 ) ),
     $                           ABS( DIF( 5 ) / DIFTRU( 5 ) ) )
                        RESULT( 4 ) = MAX( RATIO1, RATIO2 )
                     END IF
*
                     NTESTT = NTESTT + 4
*
*                    Print out tests which fail.
*
                     DO 20 J = 1, 4
                        IF( ( RESULT( J ).GE.THRSH2 .AND. J.GE.4 ) .OR.
     $                      ( RESULT( J ).GE.THRESH .AND. J.LE.3 ) )
     $                       THEN
*
*                       If this is the first test to fail,
*                       print a header to the data file.
*
                           IF( NERRS.EQ.0 ) THEN
                              WRITE( NOUT, FMT = 9997 )'DXV'
*
*                          Print out messages for built-in examples
*
*                          Matrix types
*
                              WRITE( NOUT, FMT = 9995 )
                              WRITE( NOUT, FMT = 9994 )
                              WRITE( NOUT, FMT = 9993 )
*
*                          Tests performed
*
                              WRITE( NOUT, FMT = 9992 )'''',
     $                           'transpose', ''''
*
                           END IF
                           NERRS = NERRS + 1
                           IF( RESULT( J ).LT.10000.0D0 ) THEN
                              WRITE( NOUT, FMT = 9991 )IPTYPE, IWA,
     $                           IWB, IWX, IWY, J, RESULT( J )
                           ELSE
                              WRITE( NOUT, FMT = 9990 )IPTYPE, IWA,
     $                           IWB, IWX, IWY, J, RESULT( J )
                           END IF
                        END IF
   20                CONTINUE
*
   30                CONTINUE
*
   40             CONTINUE
   50          CONTINUE
   60       CONTINUE
   70    CONTINUE
   80 CONTINUE
*
      GO TO 150
*
   90 CONTINUE
*
*     Read in data from file to check accuracy of condition estimation
*     Read input data until N=0
*
      READ( NIN, FMT = *, END = 150 )N
      IF( N.EQ.0 )
     $   GO TO 150
      DO 100 I = 1, N
         READ( NIN, FMT = * )( A( I, J ), J = 1, N )
  100 CONTINUE
      DO 110 I = 1, N
         READ( NIN, FMT = * )( B( I, J ), J = 1, N )
  110 CONTINUE
      READ( NIN, FMT = * )( DTRU( I ), I = 1, N )
      READ( NIN, FMT = * )( DIFTRU( I ), I = 1, N )
*
      NPTKNT = NPTKNT + 1
*
*     Compute eigenvalues/eigenvectors of (A, B).
*     Compute eigenvalue/eigenvector condition numbers
*     using computed eigenvectors.
*
      CALL cdlacpy( 'F', N, N, A, LDA, AI, LDA )
      CALL cdlacpy( 'F', N, N, B, LDA, BI, LDA )
*
      CALL cdggevX( 'N', 'V', 'V', 'B', N, AI, LDA, BI, LDA, ALPHAR,
     $             ALPHAI, BETA, VL, LDA, VR, LDA, ILO, IHI, LSCALE,
     $             RSCALE, ANORM, BNORM, S, DIF, WORK, LWORK, IWORK,
     $             BWORK, LINFO )
*
      IF( LINFO.NE.0 ) THEN
         RESULT( 1 ) = ULPINV
         WRITE( NOUT, FMT = 9987 )'cdggevX', LINFO, N, NPTKNT
         GO TO 140
      END IF
*
*     Compute the norm(A, B)
*
      CALL cdlacpy( 'Full', N, N, AI, LDA, WORK, N )
      CALL cdlacpy( 'Full', N, N, BI, LDA, WORK( N*N+1 ), N )
      ABNORM = DLANGE( 'Fro', N, 2*N, WORK, N, WORK )
*
*     Tests (1) and (2)
*
      RESULT( 1 ) = ZERO
      CALL DGET52( .TRUE., N, A, LDA, B, LDA, VL, LDA, ALPHAR, ALPHAI,
     $             BETA, WORK, RESULT( 1 ) )
      IF( RESULT( 2 ).GT.THRESH ) THEN
         WRITE( NOUT, FMT = 9986 )'Left', 'cdggevX', RESULT( 2 ), N,
     $      NPTKNT
      END IF
*
      RESULT( 2 ) = ZERO
      CALL DGET52( .FALSE., N, A, LDA, B, LDA, VR, LDA, ALPHAR, ALPHAI,
     $             BETA, WORK, RESULT( 2 ) )
      IF( RESULT( 3 ).GT.THRESH ) THEN
         WRITE( NOUT, FMT = 9986 )'Right', 'cdggevX', RESULT( 3 ), N,
     $      NPTKNT
      END IF
*
*     Test (3)
*
      RESULT( 3 ) = ZERO
      DO 120 I = 1, N
         IF( S( I ).EQ.ZERO ) THEN
            IF( DTRU( I ).GT.ABNORM*ULP )
     $         RESULT( 3 ) = ULPINV
         ELSE IF( DTRU( I ).EQ.ZERO ) THEN
            IF( S( I ).GT.ABNORM*ULP )
     $         RESULT( 3 ) = ULPINV
         ELSE
            WORK( I ) = MAX( ABS( DTRU( I ) / S( I ) ),
     $                  ABS( S( I ) / DTRU( I ) ) )
            RESULT( 3 ) = MAX( RESULT( 3 ), WORK( I ) )
         END IF
  120 CONTINUE
*
*     Test (4)
*
      RESULT( 4 ) = ZERO
      IF( DIF( 1 ).EQ.ZERO ) THEN
         IF( DIFTRU( 1 ).GT.ABNORM*ULP )
     $      RESULT( 4 ) = ULPINV
      ELSE IF( DIFTRU( 1 ).EQ.ZERO ) THEN
         IF( DIF( 1 ).GT.ABNORM*ULP )
     $      RESULT( 4 ) = ULPINV
      ELSE IF( DIF( 5 ).EQ.ZERO ) THEN
         IF( DIFTRU( 5 ).GT.ABNORM*ULP )
     $      RESULT( 4 ) = ULPINV
      ELSE IF( DIFTRU( 5 ).EQ.ZERO ) THEN
         IF( DIF( 5 ).GT.ABNORM*ULP )
     $      RESULT( 4 ) = ULPINV
      ELSE
         RATIO1 = MAX( ABS( DIFTRU( 1 ) / DIF( 1 ) ),
     $            ABS( DIF( 1 ) / DIFTRU( 1 ) ) )
         RATIO2 = MAX( ABS( DIFTRU( 5 ) / DIF( 5 ) ),
     $            ABS( DIF( 5 ) / DIFTRU( 5 ) ) )
         RESULT( 4 ) = MAX( RATIO1, RATIO2 )
      END IF
*
      NTESTT = NTESTT + 4
*
*     Print out tests which fail.
*
      DO 130 J = 1, 4
         IF( RESULT( J ).GE.THRSH2 ) THEN
*
*           If this is the first test to fail,
*           print a header to the data file.
*
            IF( NERRS.EQ.0 ) THEN
               WRITE( NOUT, FMT = 9997 )'DXV'
*
*              Print out messages for built-in examples
*
*              Matrix types
*
               WRITE( NOUT, FMT = 9996 )
*
*              Tests performed
*
               WRITE( NOUT, FMT = 9992 )'''', 'transpose', ''''
*
            END IF
            NERRS = NERRS + 1
            IF( RESULT( J ).LT.10000.0D0 ) THEN
               WRITE( NOUT, FMT = 9989 )NPTKNT, N, J, RESULT( J )
            ELSE
               WRITE( NOUT, FMT = 9988 )NPTKNT, N, J, RESULT( J )
            END IF
         END IF
  130 CONTINUE
*
  140 CONTINUE
*
      GO TO 90
  150 CONTINUE
*
*     Summary
*
      CALL ALASVM( 'DXV', NOUT, NERRS, NTESTT, 0 )
*
      WORK( 1 ) = MAXWRK
*
      RETURN
*
 9999 FORMAT( ' DDRGVX: ', A, ' returned INFO=', I6, '.', / 9X, 'N=',
     $      I6, ', JTYPE=', I6, ')' )
*
 9998 FORMAT( ' DDRGVX: ', A, ' Eigenvectors from ', A, ' incorrectly ',
     $      'normalized.', / ' Bits of error=', 0P, G10.3, ',', 9X,
     $      'N=', I6, ', JTYPE=', I6, ', IWA=', I5, ', IWB=', I5,
     $      ', IWX=', I5, ', IWY=', I5 )
*
 9997 FORMAT( / 1X, A3, ' -- Real Expert Eigenvalue/vector',
     $      ' problem driver' )
*
 9996 FORMAT( ' Input Example' )
*
 9995 FORMAT( ' Matrix types: ', / )
*
 9994 FORMAT( ' TYPE 1: Da is diagonal, Db is identity, ',
     $      / '     A = Y^(-H) Da X^(-1), B = Y^(-H) Db X^(-1) ',
     $      / '     YH and X are left and right eigenvectors. ', / )
*
 9993 FORMAT( ' TYPE 2: Da is quasi-diagonal, Db is identity, ',
     $      / '     A = Y^(-H) Da X^(-1), B = Y^(-H) Db X^(-1) ',
     $      / '     YH and X are left and right eigenvectors. ', / )
*
 9992 FORMAT( / ' Tests performed:  ', / 4X,
     $      ' a is alpha, b is beta, l is a left eigenvector, ', / 4X,
     $      ' r is a right eigenvector and ', A, ' means ', A, '.',
     $      / ' 1 = max | ( b A - a B )', A, ' l | / const.',
     $      / ' 2 = max | ( b A - a B ) r | / const.',
     $      / ' 3 = max ( Sest/Stru, Stru/Sest ) ',
     $      ' over all eigenvalues', /
     $      ' 4 = max( DIFest/DIFtru, DIFtru/DIFest ) ',
     $      ' over the 1st and 5th eigenvectors', / )
*
 9991 FORMAT( ' Type=', I2, ',', ' IWA=', I2, ', IWB=', I2, ', IWX=',
     $      I2, ', IWY=', I2, ', result ', I2, ' is', 0P, F8.2 )
 9990 FORMAT( ' Type=', I2, ',', ' IWA=', I2, ', IWB=', I2, ', IWX=',
     $      I2, ', IWY=', I2, ', result ', I2, ' is', 1P, D10.3 )
 9989 FORMAT( ' Input example #', I2, ', matrix order=', I4, ',',
     $      ' result ', I2, ' is', 0P, F8.2 )
 9988 FORMAT( ' Input example #', I2, ', matrix order=', I4, ',',
     $      ' result ', I2, ' is', 1P, D10.3 )
 9987 FORMAT( ' DDRGVX: ', A, ' returned INFO=', I6, '.', / 9X, 'N=',
     $      I6, ', Input example #', I2, ')' )
*
 9986 FORMAT( ' DDRGVX: ', A, ' Eigenvectors from ', A, ' incorrectly ',
     $      'normalized.', / ' Bits of error=', 0P, G10.3, ',', 9X,
     $      'N=', I6, ', Input Example #', I2, ')' )
*
*
*     End of DDRGVX
*
      END
