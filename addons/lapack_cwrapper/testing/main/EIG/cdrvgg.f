      SUBROUTINE CDRVGG( NSIZES, NN, NTYPES, DOTYPE, ISEED, THRESH,
     $                   THRSHN, NOUNIT, A, LDA, B, S, T, S2, T2, Q,
     $                   LDQ, Z, ALPHA1, BETA1, ALPHA2, BETA2, VL, VR,
     $                   WORK, LWORK, RWORK, RESULT, INFO )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      INTEGER            INFO, LDA, LDQ, LWORK, NOUNIT, NSIZES, NTYPES
      REAL               THRESH, THRSHN
*     ..
*     .. Array Arguments ..
*
*  Purpose
*  =======
*
*  CDRVGG  checks the nonsymmetric generalized eigenvalue driver
*  routines.
*                                T          T        T
*  ccgegs factors A and B as Q S Z  and Q T Z , where   means
*  transpose, T is upper triangular, S is in generalized Schur form
*  (upper triangular), and Q and Z are unitary.  It also
*  computes the generalized eigenvalues (alpha(1),beta(1)), ...,
*  (alpha(n),beta(n)), where alpha(j)=S(j,j) and beta(j)=T(j,j) --
*  thus, w(j) = alpha(j)/beta(j) is a root of the generalized
*  eigenvalue problem
*
*      det( A - w(j) B ) = 0
*
*  and m(j) = beta(j)/alpha(j) is a root of the essentially equivalent
*  problem
*
*      det( m(j) A - B ) = 0
*
*  ccgegv computes the generalized eigenvalues (alpha(1),beta(1)), ...,
*  (alpha(n),beta(n)), the matrix L whose columns contain the
*  generalized left eigenvectors l, and the matrix R whose columns
*  contain the generalized right eigenvectors r for the pair (A,B).
*
*  When CDRVGG is called, a number of matrix "sizes" ("n's") and a
*  number of matrix "types" are specified.  For each size ("n")
*  and each type of matrix, one matrix will be generated and used
*  to test the nonsymmetric eigenroutines.  For each matrix, 7
*  tests will be performed and compared with the threshhold THRESH:
*
*  Results from ccgegs:
*
*                   H
*  (1)   | A - Q S Z  | / ( |A| n ulp )
*
*                   H
*  (2)   | B - Q T Z  | / ( |B| n ulp )
*
*                H
*  (3)   | I - QQ  | / ( n ulp )
*
*                H
*  (4)   | I - ZZ  | / ( n ulp )
*
*  (5)   maximum over j of D(j)  where:
*
*                      |alpha(j) - S(j,j)|        |beta(j) - T(j,j)|
*            D(j) = ------------------------ + -----------------------
*                   max(|alpha(j)|,|S(j,j)|)   max(|beta(j)|,|T(j,j)|)
*
*  Results from ccgegv:
*
*  (6)   max over all left eigenvalue/-vector pairs (beta/alpha,l) of
*
*     | l**H * (beta A - alpha B) | / ( ulp max( |beta A|, |alpha B| ) )
*
*        where l**H is the conjugate tranpose of l.
*
*  (7)   max over all right eigenvalue/-vector pairs (beta/alpha,r) of
*
*        | (beta A - alpha B) r | / ( ulp max( |beta A|, |alpha B| ) )
*
*  Test Matrices
*  ---- --------
*
*  The sizes of the test matrices are specified by an array
*  NN(1:NSIZES); the value of each element NN(j) specifies one size.
*  The "types" are specified by a logical array DOTYPE( 1:NTYPES ); if
*  DOTYPE(j) is .TRUE., then matrix type "j" will be generated.
*  Currently, the list of possible types is:
*
*  (1)  ( 0, 0 )         (a pair of zero matrices)
*
*  (2)  ( I, 0 )         (an identity and a zero matrix)
*
*  (3)  ( 0, I )         (an identity and a zero matrix)
*
*  (4)  ( I, I )         (a pair of identity matrices)
*
*          t   t
*  (5)  ( J , J  )       (a pair of transposed Jordan blocks)
*
*                                      t                ( I   0  )
*  (6)  ( X, Y )         where  X = ( J   0  )  and Y = (      t )
*                                   ( 0   I  )          ( 0   J  )
*                        and I is a k x k identity and J a (k+1)x(k+1)
*                        Jordan block; k=(N-1)/2
*
*  (7)  ( D, I )         where D is diag( 0, 1,..., N-1 ) (a diagonal
*                        matrix with those diagonal entries.)
*  (8)  ( I, D )
*
*  (9)  ( big*D, small*I ) where "big" is near overflow and small=1/big
*
*  (10) ( small*D, big*I )
*
*  (11) ( big*I, small*D )
*
*  (12) ( small*I, big*D )
*
*  (13) ( big*D, big*I )
*
*  (14) ( small*D, small*I )
*
*  (15) ( D1, D2 )        where D1 is diag( 0, 0, 1, ..., N-3, 0 ) and
*                         D2 is diag( 0, N-3, N-4,..., 1, 0, 0 )
*            t   t
*  (16) Q ( J , J ) Z     where Q and Z are random unitary matrices.
*
*  (17) Q ( T1, T2 ) Z    where T1 and T2 are upper triangular matrices
*                         with random O(1) entries above the diagonal
*                         and diagonal entries diag(T1) =
*                         ( 0, 0, 1, ..., N-3, 0 ) and diag(T2) =
*                         ( 0, N-3, N-4,..., 1, 0, 0 )
*
*  (18) Q ( T1, T2 ) Z    diag(T1) = ( 0, 0, 1, 1, s, ..., s, 0 )
*                         diag(T2) = ( 0, 1, 0, 1,..., 1, 0 )
*                         s = machine precision.
*
*  (19) Q ( T1, T2 ) Z    diag(T1)=( 0,0,1,1, 1-d, ..., 1-(N-5)*d=s, 0 )
*                         diag(T2) = ( 0, 1, 0, 1, ..., 1, 0 )
*
*                                                         N-5
*  (20) Q ( T1, T2 ) Z    diag(T1)=( 0, 0, 1, 1, a, ..., a   =s, 0 )
*                         diag(T2) = ( 0, 1, 0, 1, ..., 1, 0, 0 )
*
*  (21) Q ( T1, T2 ) Z    diag(T1)=( 0, 0, 1, r1, r2, ..., r(N-4), 0 )
*                         diag(T2) = ( 0, 1, 0, 1, ..., 1, 0, 0 )
*                         where r1,..., r(N-4) are random.
*
*  (22) Q ( big*T1, small*T2 ) Z    diag(T1) = ( 0, 0, 1, ..., N-3, 0 )
*                                   diag(T2) = ( 0, 1, ..., 1, 0, 0 )
*
*  (23) Q ( small*T1, big*T2 ) Z    diag(T1) = ( 0, 0, 1, ..., N-3, 0 )
*                                   diag(T2) = ( 0, 1, ..., 1, 0, 0 )
*
*  (24) Q ( small*T1, small*T2 ) Z  diag(T1) = ( 0, 0, 1, ..., N-3, 0 )
*                                   diag(T2) = ( 0, 1, ..., 1, 0, 0 )
*
*  (25) Q ( big*T1, big*T2 ) Z      diag(T1) = ( 0, 0, 1, ..., N-3, 0 )
*                                   diag(T2) = ( 0, 1, ..., 1, 0, 0 )
*
*  (26) Q ( T1, T2 ) Z     where T1 and T2 are random upper-triangular
*                          matrices.
*
*  Arguments
*  =========
*
*  NSIZES  (input) INTEGER
*          The number of sizes of matrices to use.  If it is zero,
*          CDRVGG does nothing.  It must be at least zero.
*
*  NN      (input) INTEGER array, dimension (NSIZES)
*          An array containing the sizes to be used for the matrices.
*          Zero values will be skipped.  The values must be at least
*          zero.
*
*  NTYPES  (input) INTEGER
*          The number of elements in DOTYPE.   If it is zero, CDRVGG
*          does nothing.  It must be at least zero.  If it is MAXTYP+1
*          and NSIZES is 1, then an additional type, MAXTYP+1 is
*          defined, which is to use whatever matrix is in A.  This
*          is only useful if DOTYPE(1:MAXTYP) is .FALSE. and
*          DOTYPE(MAXTYP+1) is .TRUE. .
*
*  DOTYPE  (input) LOGICAL array, dimension (NTYPES)
*          If DOTYPE(j) is .TRUE., then for each size in NN a
*          matrix of that size and of type j will be generated.
*          If NTYPES is smaller than the maximum number of types
*          defined (PARAMETER MAXTYP), then types NTYPES+1 through
*          MAXTYP will not be generated.  If NTYPES is larger
*          than MAXTYP, DOTYPE(MAXTYP+1) through DOTYPE(NTYPES)
*          will be ignored.
*
*  ISEED   (input/output) INTEGER array, dimension (4)
*          On entry ISEED specifies the seed of the random number
*          generator. The array elements should be between 0 and 4095;
*          if not they will be reduced mod 4096.  Also, ISEED(4) must
*          be odd.  The random number generator uses a linear
*          congruential sequence limited to small integers, and so
*          should produce machine independent random numbers. The
*          values of ISEED are changed on exit, and can be used in the
*          next call to CDRVGG to continue the same random number
*          sequence.
*
*  THRESH  (input) REAL
*          A test will count as "failed" if the "error", computed as
*          described above, exceeds THRESH.  Note that the error is
*          scaled to be O(1), so THRESH should be a reasonably small
*          multiple of 1, e.g., 10 or 100.  In particular, it should
*          not depend on the precision (single vs. double) or the size
*          of the matrix.  It must be at least zero.
*
*  THRSHN  (input) REAL
*          Threshhold for reporting eigenvector normalization error.
*          If the normalization of any eigenvector differs from 1 by
*          more than THRSHN*ulp, then a special error message will be
*          printed.  (This is handled separately from the other tests,
*          since only a compiler or programming error should cause an
*          error message, at least if THRSHN is at least 5--10.)
*
*  NOUNIT  (input) INTEGER
*          The FORTRAN unit number for printing out error messages
*          (e.g., if a routine returns IINFO not equal to 0.)
*
*  A       (input/workspace) COMPLEX array, dimension (LDA, max(NN))
*          Used to hold the original A matrix.  Used as input only
*          if NTYPES=MAXTYP+1, DOTYPE(1:MAXTYP)=.FALSE., and
*          DOTYPE(MAXTYP+1)=.TRUE.
*
*  LDA     (input) INTEGER
*          The leading dimension of A, B, S, T, S2, and T2.
*          It must be at least 1 and at least max( NN ).
*
*  B       (input/workspace) COMPLEX array, dimension (LDA, max(NN))
*          Used to hold the original B matrix.  Used as input only
*          if NTYPES=MAXTYP+1, DOTYPE(1:MAXTYP)=.FALSE., and
*          DOTYPE(MAXTYP+1)=.TRUE.
*
*  S       (workspace) COMPLEX array, dimension (LDA, max(NN))
*          The upper triangular matrix computed from A by ccgegs.
*
*  T       (workspace) COMPLEX array, dimension (LDA, max(NN))
*          The upper triangular matrix computed from B by ccgegs.
*
*  S2      (workspace) COMPLEX array, dimension (LDA, max(NN))
*          The matrix computed from A by ccgegv.  This will be the
*          Schur (upper triangular) form of some matrix related to A,
*          but will not, in general, be the same as S.
*
*  T2      (workspace) COMPLEX array, dimension (LDA, max(NN))
*          The matrix computed from B by ccgegv.  This will be the
*          Schur form of some matrix related to B, but will not, in
*          general, be the same as T.
*
*  Q       (workspace) COMPLEX array, dimension (LDQ, max(NN))
*          The (left) unitary matrix computed by ccgegs.
*
*  LDQ     (input) INTEGER
*          The leading dimension of Q, Z, VL, and VR.  It must
*          be at least 1 and at least max( NN ).
*
*  Z       (workspace) COMPLEX array, dimension (LDQ, max(NN))
*          The (right) unitary matrix computed by ccgegs.
*
*  ALPHA1  (workspace) COMPLEX array, dimension (max(NN))
*  BETA1   (workspace) COMPLEX array, dimension (max(NN))
*          The generalized eigenvalues of (A,B) computed by ccgegs.
*          ALPHA1(k) / BETA1(k)  is the k-th generalized eigenvalue of
*          the matrices in A and B.
*
*  ALPHA2  (workspace) COMPLEX array, dimension (max(NN))
*  BETA2   (workspace) COMPLEX array, dimension (max(NN))
*          The generalized eigenvalues of (A,B) computed by ccgegv.
*          ALPHA2(k) / BETA2(k)  is the k-th generalized eigenvalue of
*          the matrices in A and B.
*
*  VL      (workspace) COMPLEX array, dimension (LDQ, max(NN))
*          The (lower triangular) left eigenvector matrix for the
*          matrices in A and B.
*
*  VR      (workspace) COMPLEX array, dimension (LDQ, max(NN))
*          The (upper triangular) right eigenvector matrix for the
*          matrices in A and B.
*
*  WORK    (workspace) COMPLEX array, dimension (LWORK)
*
*  LWORK   (input) INTEGER
*          The number of entries in WORK.  This must be at least
*          MAX( 2*N, N*(NB+1), (k+1)*(2*k+N+1) ), where "k" is the
*          sum of the blocksize and number-of-shifts for cchgeqz, and
*          NB is the greatest of the blocksizes for ccgeqrf, ccunmqr,
*          and ccungqr.  (The blocksizes and the number-of-shifts are
*          retrieved through calls to ILAENV.)
*
*  RWORK   (workspace) REAL array, dimension (8*N)
*
*  RESULT  (output) REAL array, dimension (7)
*          The values computed by the tests described above.
*          The values are currently limited to 1/ulp, to avoid
*          overflow.
*
*  INFO    (output) INTEGER
*          = 0:  successful exit
*          < 0:  if INFO = -i, the i-th argument had an illegal value.
*          > 0:  A routine returned an error code.  INFO is the
*                absolute value of the INFO value returned.
*
*  =====================================================================
*
      LOGICAL            DOTYPE( * )
      INTEGER            ISEED( 4 ), NN( * )
      REAL               RESULT( * ), RWORK( * )
      COMPLEX            A( LDA, * ), ALPHA1( * ), ALPHA2( * ),
     $                   B( LDA, * ), BETA1( * ), BETA2( * ),
     $                   Q( LDQ, * ), S( LDA, * ), S2( LDA, * ),
     $                   T( LDA, * ), T2( LDA, * ), VL( LDQ, * ),
     $                   VR( LDQ, * ), WORK( * ), Z( LDQ, * )
*     ..
*     .. Parameters ..
      REAL               ZERO, ONE
      PARAMETER          ( ZERO = 0.0E+0, ONE = 1.0E+0 )
      COMPLEX            CZERO, CONE
      PARAMETER          ( CZERO = ( 0.0E+0, 0.0E+0 ),
     $                   CONE = ( 1.0E+0, 0.0E+0 ) )
      INTEGER            MAXTYP
      PARAMETER          ( MAXTYP = 26 )
*     ..
*     .. Local Scalars ..
      LOGICAL            BADNN
      INTEGER            I1, IADD, IINFO, IN, J, JC, JR, JSIZE, JTYPE,
     $                   LWKOPT, MTYPES, N, N1, NB, NBZ, NERRS, NMATS,
     $                   NMAX, NS, NTEST, NTESTT
      REAL               SAFMAX, SAFMIN, TEMP1, TEMP2, ULP, ULPINV
      COMPLEX            CTEMP, X
*     ..
*     .. Local Arrays ..
      LOGICAL            LASIGN( MAXTYP ), LBSIGN( MAXTYP )
      INTEGER            IOLDSD( 4 ), KADD( 6 ), KAMAGN( MAXTYP ),
     $                   KATYPE( MAXTYP ), KAZERO( MAXTYP ),
     $                   KBMAGN( MAXTYP ), KBTYPE( MAXTYP ),
     $                   KBZERO( MAXTYP ), KCLASS( MAXTYP ),
     $                   KTRIAN( MAXTYP ), KZ1( 6 ), KZ2( 6 )
      REAL               DUMMA( 4 ), RMAGN( 0: 3 )
*     ..
*     .. External Functions ..
      INTEGER            ILAENV
      REAL               SLAMCH
      COMPLEX            CLARND
      EXTERNAL           ILAENV, SLAMCH, CLARND
*     ..
*     .. External Subroutines ..
      EXTERNAL          ALASVM, ccgegs, ccgegv, CGET51, CGET52, cclacpy,
     $               cclarfG, cclaset, CLATM4, ccunm2r, cslabad, xerbla
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, AIMAG, CONJG, MAX, MIN, REAL, SIGN
*     ..
*     .. Statement Functions ..
      REAL               ABS1
*     ..
*     .. Statement Function definitions ..
      ABS1( X ) = ABS( REAL( X ) ) + ABS( AIMAG( X ) )
*     ..
*     .. Data statements ..
      DATA               KCLASS / 15*1, 10*2, 1*3 /
      DATA               KZ1 / 0, 1, 2, 1, 3, 3 /
      DATA               KZ2 / 0, 0, 1, 2, 1, 1 /
      DATA               KADD / 0, 0, 0, 0, 3, 2 /
      DATA               KATYPE / 0, 1, 0, 1, 2, 3, 4, 1, 4, 4, 1, 1, 4,
     $                   4, 4, 2, 4, 5, 8, 7, 9, 4*4, 0 /
      DATA               KBTYPE / 0, 0, 1, 1, 2, -3, 1, 4, 1, 1, 4, 4,
     $                   1, 1, -4, 2, -4, 8*8, 0 /
      DATA               KAZERO / 6*1, 2, 1, 2*2, 2*1, 2*2, 3, 1, 3,
     $                   4*5, 4*3, 1 /
      DATA               KBZERO / 6*1, 1, 2, 2*1, 2*2, 2*1, 4, 1, 4,
     $                   4*6, 4*4, 1 /
      DATA               KAMAGN / 8*1, 2, 3, 2, 3, 2, 3, 7*1, 2, 3, 3,
     $                   2, 1 /
      DATA               KBMAGN / 8*1, 3, 2, 3, 2, 2, 3, 7*1, 3, 2, 3,
     $                   2, 1 /
      DATA               KTRIAN / 16*0, 10*1 /
      DATA               LASIGN / 6*.FALSE., .TRUE., .FALSE., 2*.TRUE.,
     $                   2*.FALSE., 3*.TRUE., .FALSE., .TRUE.,
     $                   3*.FALSE., 5*.TRUE., .FALSE. /
      DATA               LBSIGN / 7*.FALSE., .TRUE., 2*.FALSE.,
     $                   2*.TRUE., 2*.FALSE., .TRUE., .FALSE., .TRUE.,
     $                   9*.FALSE. /
*     ..
*     .. Executable Statements ..
*
*     Check for errors
*
      INFO = 0
*
      BADNN = .FALSE.
      NMAX = 1
      DO 10 J = 1, NSIZES
         NMAX = MAX( NMAX, NN( J ) )
         IF( NN( J ).LT.0 )
     $      BADNN = .TRUE.
   10 CONTINUE
*
*     Maximum blocksize and shift -- we assume that blocksize and number
*     of shifts are monotone increasing functions of N.
*
      NB = MAX( 1, ILAENV( 1, 'ccgeqrf', ' ', NMAX, NMAX, -1, -1 ),
     $     ILAENV( 1, 'ccunmqr', 'LC', NMAX, NMAX, NMAX, -1 ),
     $     ILAENV( 1, 'ccungqr', ' ', NMAX, NMAX, NMAX, -1 ) )
      NBZ = ILAENV( 1, 'cchgeqz', 'SII', NMAX, 1, NMAX, 0 )
      NS = ILAENV( 4, 'cchgeqz', 'SII', NMAX, 1, NMAX, 0 )
      I1 = NBZ + NS
      LWKOPT = MAX( 2*NMAX, NMAX*( NB+1 ), ( 2*I1+NMAX+1 )*( I1+1 ) )
*
*     Check for errors
*
      IF( NSIZES.LT.0 ) THEN
         INFO = -1
      ELSE IF( BADNN ) THEN
         INFO = -2
      ELSE IF( NTYPES.LT.0 ) THEN
         INFO = -3
      ELSE IF( THRESH.LT.ZERO ) THEN
         INFO = -6
      ELSE IF( LDA.LE.1 .OR. LDA.LT.NMAX ) THEN
         INFO = -10
      ELSE IF( LDQ.LE.1 .OR. LDQ.LT.NMAX ) THEN
         INFO = -19
      ELSE IF( LWKOPT.GT.LWORK ) THEN
         INFO = -30
      END IF
*
      IF( INFO.NE.0 ) THEN
         CALL xerbla( 'CDRVGG', -INFO )
         RETURN
      END IF
*
*     Quick return if possible
*
      IF( NSIZES.EQ.0 .OR. NTYPES.EQ.0 )
     $   RETURN
*
      ULP = SLAMCH( 'Precision' )
      SAFMIN = SLAMCH( 'Safe minimum' )
      SAFMIN = SAFMIN / ULP
      SAFMAX = ONE / SAFMIN
      CALL cslabad( SAFMIN, SAFMAX )
      ULPINV = ONE / ULP
*
*     The values RMAGN(2:3) depend on N, see below.
*
      RMAGN( 0 ) = ZERO
      RMAGN( 1 ) = ONE
*
*     Loop over sizes, types
*
      NTESTT = 0
      NERRS = 0
      NMATS = 0
*
      DO 160 JSIZE = 1, NSIZES
         N = NN( JSIZE )
         N1 = MAX( 1, N )
         RMAGN( 2 ) = SAFMAX*ULP / REAL( N1 )
         RMAGN( 3 ) = SAFMIN*ULPINV*N1
*
         IF( NSIZES.NE.1 ) THEN
            MTYPES = MIN( MAXTYP, NTYPES )
         ELSE
            MTYPES = MIN( MAXTYP+1, NTYPES )
         END IF
*
         DO 150 JTYPE = 1, MTYPES
            IF( .NOT.DOTYPE( JTYPE ) )
     $         GO TO 150
            NMATS = NMATS + 1
            NTEST = 0
*
*           Save ISEED in case of an error.
*
            DO 20 J = 1, 4
               IOLDSD( J ) = ISEED( J )
   20       CONTINUE
*
*           Initialize RESULT
*
            DO 30 J = 1, 7
               RESULT( J ) = ZERO
   30       CONTINUE
*
*           Compute A and B
*
*           Description of control parameters:
*
*           KCLASS: =1 means w/o rotation, =2 means w/ rotation,
*                   =3 means random.
*           KATYPE: the "type" to be passed to CLATM4 for computing A.
*           KAZERO: the pattern of zeros on the diagonal for A:
*                   =1: ( xxx ), =2: (0, xxx ) =3: ( 0, 0, xxx, 0 ),
*                   =4: ( 0, xxx, 0, 0 ), =5: ( 0, 0, 1, xxx, 0 ),
*                   =6: ( 0, 1, 0, xxx, 0 ).  (xxx means a string of
*                   non-zero entries.)
*           KAMAGN: the magnitude of the matrix: =0: zero, =1: O(1),
*                   =2: large, =3: small.
*           LASIGN: .TRUE. if the diagonal elements of A are to be
*                   multiplied by a random magnitude 1 number.
*           KBTYPE, KBZERO, KBMAGN, IBSIGN: the same, but for B.
*           KTRIAN: =0: don't fill in the upper triangle, =1: do.
*           KZ1, KZ2, KADD: used to implement KAZERO and KBZERO.
*           RMAGN:  used to implement KAMAGN and KBMAGN.
*
            IF( MTYPES.GT.MAXTYP )
     $         GO TO 110
            IINFO = 0
            IF( KCLASS( JTYPE ).LT.3 ) THEN
*
*              Generate A (w/o rotation)
*
               IF( ABS( KATYPE( JTYPE ) ).EQ.3 ) THEN
                  IN = 2*( ( N-1 ) / 2 ) + 1
                  IF( IN.NE.N )
     $               CALL cclaset( 'Full', N, N, CZERO, CZERO, A, LDA )
               ELSE
                  IN = N
               END IF
               CALL CLATM4( KATYPE( JTYPE ), IN, KZ1( KAZERO( JTYPE ) ),
     $                      KZ2( KAZERO( JTYPE ) ), LASIGN( JTYPE ),
     $                      RMAGN( KAMAGN( JTYPE ) ), ULP,
     $                      RMAGN( KTRIAN( JTYPE )*KAMAGN( JTYPE ) ), 2,
     $                      ISEED, A, LDA )
               IADD = KADD( KAZERO( JTYPE ) )
               IF( IADD.GT.0 .AND. IADD.LE.N )
     $            A( IADD, IADD ) = RMAGN( KAMAGN( JTYPE ) )
*
*              Generate B (w/o rotation)
*
               IF( ABS( KBTYPE( JTYPE ) ).EQ.3 ) THEN
                  IN = 2*( ( N-1 ) / 2 ) + 1
                  IF( IN.NE.N )
     $               CALL cclaset( 'Full', N, N, CZERO, CZERO, B, LDA )
               ELSE
                  IN = N
               END IF
               CALL CLATM4( KBTYPE( JTYPE ), IN, KZ1( KBZERO( JTYPE ) ),
     $                      KZ2( KBZERO( JTYPE ) ), LBSIGN( JTYPE ),
     $                      RMAGN( KBMAGN( JTYPE ) ), ONE,
     $                      RMAGN( KTRIAN( JTYPE )*KBMAGN( JTYPE ) ), 2,
     $                      ISEED, B, LDA )
               IADD = KADD( KBZERO( JTYPE ) )
               IF( IADD.NE.0 .AND. IADD.LE.N )
     $            B( IADD, IADD ) = RMAGN( KBMAGN( JTYPE ) )
*
               IF( KCLASS( JTYPE ).EQ.2 .AND. N.GT.0 ) THEN
*
*                 Include rotations
*
*                 Generate Q, Z as Householder transformations times
*                 a diagonal matrix.
*
                  DO 50 JC = 1, N - 1
                     DO 40 JR = JC, N
                        Q( JR, JC ) = CLARND( 3, ISEED )
                        Z( JR, JC ) = CLARND( 3, ISEED )
   40                CONTINUE
                    CALL cclarfG( N+1-JC, Q( JC, JC ), Q( JC+1, JC ), 1,
     $                            WORK( JC ) )
                     WORK( 2*N+JC ) = SIGN( ONE, REAL( Q( JC, JC ) ) )
                     Q( JC, JC ) = CONE
                    CALL cclarfG( N+1-JC, Z( JC, JC ), Z( JC+1, JC ), 1,
     $                            WORK( N+JC ) )
                     WORK( 3*N+JC ) = SIGN( ONE, REAL( Z( JC, JC ) ) )
                     Z( JC, JC ) = CONE
   50             CONTINUE
                  CTEMP = CLARND( 3, ISEED )
                  Q( N, N ) = CONE
                  WORK( N ) = CZERO
                  WORK( 3*N ) = CTEMP / ABS( CTEMP )
                  CTEMP = CLARND( 3, ISEED )
                  Z( N, N ) = CONE
                  WORK( 2*N ) = CZERO
                  WORK( 4*N ) = CTEMP / ABS( CTEMP )
*
*                 Apply the diagonal matrices
*
                  DO 70 JC = 1, N
                     DO 60 JR = 1, N
                        A( JR, JC ) = WORK( 2*N+JR )*
     $                                CONJG( WORK( 3*N+JC ) )*
     $                                A( JR, JC )
                        B( JR, JC ) = WORK( 2*N+JR )*
     $                                CONJG( WORK( 3*N+JC ) )*
     $                                B( JR, JC )
   60                CONTINUE
   70             CONTINUE
                  CALL ccunm2r( 'L', 'N', N, N, N-1, Q, LDQ, WORK, A,
     $                         LDA, WORK( 2*N+1 ), IINFO )
                  IF( IINFO.NE.0 )
     $               GO TO 100
                 CALL ccunm2r( 'R', 'C', N, N, N-1, Z, LDQ, WORK( N+1 ),
     $                         A, LDA, WORK( 2*N+1 ), IINFO )
                  IF( IINFO.NE.0 )
     $               GO TO 100
                  CALL ccunm2r( 'L', 'N', N, N, N-1, Q, LDQ, WORK, B,
     $                         LDA, WORK( 2*N+1 ), IINFO )
                  IF( IINFO.NE.0 )
     $               GO TO 100
                 CALL ccunm2r( 'R', 'C', N, N, N-1, Z, LDQ, WORK( N+1 ),
     $                         B, LDA, WORK( 2*N+1 ), IINFO )
                  IF( IINFO.NE.0 )
     $               GO TO 100
               END IF
            ELSE
*
*              Random matrices
*
               DO 90 JC = 1, N
                  DO 80 JR = 1, N
                     A( JR, JC ) = RMAGN( KAMAGN( JTYPE ) )*
     $                             CLARND( 4, ISEED )
                     B( JR, JC ) = RMAGN( KBMAGN( JTYPE ) )*
     $                             CLARND( 4, ISEED )
   80             CONTINUE
   90          CONTINUE
            END IF
*
  100       CONTINUE
*
            IF( IINFO.NE.0 ) THEN
               WRITE( NOUNIT, FMT = 9999 )'Generator', IINFO, N, JTYPE,
     $            IOLDSD
               INFO = ABS( IINFO )
               RETURN
            END IF
*
  110       CONTINUE
*
*           Call ccgegs to compute H, T, Q, Z, alpha, and beta.
*
            CALL cclacpy( ' ', N, N, A, LDA, S, LDA )
            CALL cclacpy( ' ', N, N, B, LDA, T, LDA )
            NTEST = 1
            RESULT( 1 ) = ULPINV
*
            CALL ccgegs( 'V', 'V', N, S, LDA, T, LDA, ALPHA1, BETA1, Q,
     $                  LDQ, Z, LDQ, WORK, LWORK, RWORK, IINFO )
            IF( IINFO.NE.0 ) THEN
               WRITE( NOUNIT, FMT = 9999 )'ccgegs', IINFO, N, JTYPE,
     $            IOLDSD
               INFO = ABS( IINFO )
               GO TO 130
            END IF
*
            NTEST = 4
*
*           Do tests 1--4
*
            CALL CGET51( 1, N, A, LDA, S, LDA, Q, LDQ, Z, LDQ, WORK,
     $                   RWORK, RESULT( 1 ) )
            CALL CGET51( 1, N, B, LDA, T, LDA, Q, LDQ, Z, LDQ, WORK,
     $                   RWORK, RESULT( 2 ) )
            CALL CGET51( 3, N, B, LDA, T, LDA, Q, LDQ, Q, LDQ, WORK,
     $                   RWORK, RESULT( 3 ) )
            CALL CGET51( 3, N, B, LDA, T, LDA, Z, LDQ, Z, LDQ, WORK,
     $                   RWORK, RESULT( 4 ) )
*
*           Do test 5: compare eigenvalues with diagonals.
*
            TEMP1 = ZERO
*
            DO 120 J = 1, N
               TEMP2 = ( ABS1( ALPHA1( J )-S( J, J ) ) /
     $                 MAX( SAFMIN, ABS1( ALPHA1( J ) ), ABS1( S( J,
     $                 J ) ) )+ABS1( BETA1( J )-T( J, J ) ) /
     $                 MAX( SAFMIN, ABS1( BETA1( J ) ), ABS1( T( J,
     $                 J ) ) ) ) / ULP
               TEMP1 = MAX( TEMP1, TEMP2 )
  120       CONTINUE
            RESULT( 5 ) = TEMP1
*
*           Call ccgegv to compute S2, T2, VL, and VR, do tests.
*
*           Eigenvalues and Eigenvectors
*
            CALL cclacpy( ' ', N, N, A, LDA, S2, LDA )
            CALL cclacpy( ' ', N, N, B, LDA, T2, LDA )
            NTEST = 6
            RESULT( 6 ) = ULPINV
*
            CALL ccgegv( 'V', 'V', N, S2, LDA, T2, LDA, ALPHA2, BETA2,
     $                  VL, LDQ, VR, LDQ, WORK, LWORK, RWORK, IINFO )
            IF( IINFO.NE.0 ) THEN
               WRITE( NOUNIT, FMT = 9999 )'ccgegv', IINFO, N, JTYPE,
     $            IOLDSD
               INFO = ABS( IINFO )
               GO TO 130
            END IF
*
            NTEST = 7
*
*           Do Tests 6 and 7
*
            CALL CGET52( .TRUE., N, A, LDA, B, LDA, VL, LDQ, ALPHA2,
     $                   BETA2, WORK, RWORK, DUMMA( 1 ) )
            RESULT( 6 ) = DUMMA( 1 )
            IF( DUMMA( 2 ).GT.THRSHN ) THEN
               WRITE( NOUNIT, FMT = 9998 )'Left', 'ccgegv', DUMMA( 2 ),
     $            N, JTYPE, IOLDSD
            END IF
*
            CALL CGET52( .FALSE., N, A, LDA, B, LDA, VR, LDQ, ALPHA2,
     $                   BETA2, WORK, RWORK, DUMMA( 1 ) )
            RESULT( 7 ) = DUMMA( 1 )
            IF( DUMMA( 2 ).GT.THRESH ) THEN
               WRITE( NOUNIT, FMT = 9998 )'Right', 'ccgegv', DUMMA( 2 ),
     $            N, JTYPE, IOLDSD
            END IF
*
*           End of Loop -- Check for RESULT(j) > THRESH
*
  130       CONTINUE
*
            NTESTT = NTESTT + NTEST
*
*           Print out tests which fail.
*
            DO 140 JR = 1, NTEST
               IF( RESULT( JR ).GE.THRESH ) THEN
*
*                 If this is the first test to fail,
*                 print a header to the data file.
*
                  IF( NERRS.EQ.0 ) THEN
                     WRITE( NOUNIT, FMT = 9997 )'CGG'
*
*                    Matrix types
*
                     WRITE( NOUNIT, FMT = 9996 )
                     WRITE( NOUNIT, FMT = 9995 )
                     WRITE( NOUNIT, FMT = 9994 )'Unitary'
*
*                    Tests performed
*
                     WRITE( NOUNIT, FMT = 9993 )'unitary', '*',
     $                  'conjugate transpose', ( '*', J = 1, 5 )
*
                  END IF
                  NERRS = NERRS + 1
                  IF( RESULT( JR ).LT.10000.0 ) THEN
                     WRITE( NOUNIT, FMT = 9992 )N, JTYPE, IOLDSD, JR,
     $                  RESULT( JR )
                  ELSE
                     WRITE( NOUNIT, FMT = 9991 )N, JTYPE, IOLDSD, JR,
     $                  RESULT( JR )
                  END IF
               END IF
  140       CONTINUE
*
  150    CONTINUE
  160 CONTINUE
*
*     Summary
*
      CALL ALASVM( 'CGG', NOUNIT, NERRS, NTESTT, 0 )
      RETURN
*
 9999 FORMAT( ' CDRVGG: ', A, ' returned INFO=', I6, '.', / 9X, 'N=',
     $      I6, ', JTYPE=', I6, ', ISEED=(', 3( I5, ',' ), I5, ')' )
*
 9998 FORMAT( ' CDRVGG: ', A, ' Eigenvectors from ', A, ' incorrectly ',
     $      'normalized.', / ' Bits of error=', 0P, G10.3, ',', 9X,
     $      'N=', I6, ', JTYPE=', I6, ', ISEED=(', 3( I5, ',' ), I5,
     $      ')' )
*
 9997 FORMAT( / 1X, A3,
     $      ' -- Complex Generalized eigenvalue problem driver' )
*
 9996 FORMAT( ' Matrix types (see CDRVGG for details): ' )
*
 9995 FORMAT( ' Special Matrices:', 23X,
     $      '(J''=transposed Jordan block)',
     $      / '   1=(0,0)  2=(I,0)  3=(0,I)  4=(I,I)  5=(J'',J'')  ',
     $      '6=(diag(J'',I), diag(I,J''))', / ' Diagonal Matrices:  ( ',
     $      'D=diag(0,1,2,...) )', / '   7=(D,I)   9=(large*D, small*I',
     $      ')  11=(large*I, small*D)  13=(large*D, large*I)', /
     $      '   8=(I,D)  10=(small*D, large*I)  12=(small*I, large*D) ',
     $      ' 14=(small*D, small*I)', / '  15=(D, reversed D)' )
 9994 FORMAT( ' Matrices Rotated by Random ', A, ' Matrices U, V:',
     $      / '  16=Transposed Jordan Blocks             19=geometric ',
     $      'alpha, beta=0,1', / '  17=arithm. alpha&beta             ',
     $      '      20=arithmetic alpha, beta=0,1', / '  18=clustered ',
     $      'alpha, beta=0,1            21=random alpha, beta=0,1',
     $      / ' Large & Small Matrices:', / '  22=(large, small)   ',
     $      '23=(small,large)    24=(small,small)    25=(large,large)',
     $      / '  26=random O(1) matrices.' )
*
 9993 FORMAT( / ' Tests performed:  (S is Schur, T is triangular, ',
     $      'Q and Z are ', A, ',', / 20X,
     $      'l and r are the appropriate left and right', / 19X,
     $      'eigenvectors, resp., a is alpha, b is beta, and', / 19X, A,
     $      ' means ', A, '.)', / ' 1 = | A - Q S Z', A,
     $      ' | / ( |A| n ulp )      2 = | B - Q T Z', A,
     $      ' | / ( |B| n ulp )', / ' 3 = | I - QQ', A,
     $      ' | / ( n ulp )             4 = | I - ZZ', A,
     $      ' | / ( n ulp )', /
     $      ' 5 = difference between (alpha,beta) and diagonals of',
     $      ' (S,T)', / ' 6 = max | ( b A - a B )', A,
     $      ' l | / const.   7 = max | ( b A - a B ) r | / const.',
     $      / 1X )
 9992 FORMAT( ' Matrix order=', I5, ', type=', I2, ', seed=',
     $      4( I4, ',' ), ' result ', I3, ' is', 0P, F8.2 )
 9991 FORMAT( ' Matrix order=', I5, ', type=', I2, ', seed=',
     $      4( I4, ',' ), ' result ', I3, ' is', 1P, E10.3 )
*
*     End of CDRVGG
*
      END