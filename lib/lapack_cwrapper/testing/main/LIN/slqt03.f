      SUBROUTINE SLQT03( M, N, K, AF, C, CC, Q, LDA, TAU, WORK, LWORK,
     $                   RWORK, RESULT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      INTEGER            K, LDA, LWORK, M, N
*     ..
*     .. Array Arguments ..
      REAL               AF( LDA, * ), C( LDA, * ), CC( LDA, * ),
     $                   Q( LDA, * ), RESULT( * ), RWORK( * ), TAU( * 
     $  ), 
     $                   WORK( LWORK )
*     ..
*
*  Purpose
*  =======
*
*  SLQT03 tests csormlq, which computes Q*C, Q'*C, C*Q or C*Q'.
*
*  SLQT03 compares the results of a call to csormlq with the results of
*  forming Q explicitly by a call to csorglq and then performing matrix
*  multiplication by a call to SGEMM.
*
*  Arguments
*  =========
*
*  M       (input) INTEGER
*          The number of rows or columns of the matrix C; C is n-by-m if
*          Q is applied from the left, or m-by-n if Q is applied from
*          the right.  M >= 0.
*
*  N       (input) INTEGER
*          The order of the orthogonal matrix Q.  N >= 0.
*
*  K       (input) INTEGER
*          The number of elementary reflectors whose product defines the
*          orthogonal matrix Q.  N >= K >= 0.
*
*  AF      (input) REAL array, dimension (LDA,N)
*          Details of the LQ factorization of an m-by-n matrix, as
*          returned by csgelqf. See csgelqf for further details.
*
*  C       (workspace) REAL array, dimension (LDA,N)
*
*  CC      (workspace) REAL array, dimension (LDA,N)
*
*  Q       (workspace) REAL array, dimension (LDA,N)
*
*  LDA     (input) INTEGER
*          The leading dimension of the arrays AF, C, CC, and Q.
*
*  TAU     (input) REAL array, dimension (min(M,N))
*          The scalar factors of the elementary reflectors corresponding
*          to the LQ factorization in AF.
*
*  WORK    (workspace) REAL array, dimension (LWORK)
*
*  LWORK   (input) INTEGER
*          The length of WORK.  LWORK must be at least M, and should be
*          M*NB, where NB is the blocksize for this environment.
*
*  RWORK   (workspace) REAL array, dimension (M)
*
*  RESULT  (output) REAL array, dimension (4)
*          The test ratios compare two techniques for multiplying a
*          random matrix C by an n-by-n orthogonal matrix Q.
*          RESULT(1) = norm( Q*C - Q*C )  / ( N * norm(C) * EPS )
*          RESULT(2) = norm( C*Q - C*Q )  / ( N * norm(C) * EPS )
*          RESULT(3) = norm( Q'*C - Q'*C )/ ( N * norm(C) * EPS )
*          RESULT(4) = norm( C*Q' - C*Q' )/ ( N * norm(C) * EPS )
*
*  =====================================================================
*
*     .. Parameters ..
      REAL               ONE
      PARAMETER          ( ONE = 1.0E0 )
      REAL               ROGUE
      PARAMETER          ( ROGUE = -1.0E+10 )
*     ..
*     .. Local Scalars ..
      CHARACTER          SIDE, TRANS
      INTEGER            INFO, ISIDE, ITRANS, J, MC, NC
      REAL               CNORM, EPS, RESID
*     ..
*     .. External Functions ..
      LOGICAL            LSAME
      REAL               SLAMCH, SLANGE
      EXTERNAL           LSAME, SLAMCH, SLANGE
*     ..
*     .. External Subroutines ..
      EXTERNAL           SGEMM, cslacpy, cslarnv, cslaset, csorglq, 
     $  csormlq 
*     ..
*     .. Local Arrays ..
      INTEGER            ISEED( 4 )
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          MAX, REAL
*     ..
*     .. Scalars in Common ..
      CHARACTER*7        SRNAMT
*     ..
*     .. Common blocks ..
      COMMON             / SRNAMC / SRNAMT
*     ..
*     .. Data statements ..
      DATA               ISEED / 1988, 1989, 1990, 1991 /
*     ..
*     .. Executable Statements ..
*
      EPS = SLAMCH( 'Epsilon' )
*
*     Copy the first k rows of the factorization to the array Q
*
      CALL cslaset( 'Full', N, N, ROGUE, ROGUE, Q, LDA )
      CALL cslacpy( 'Upper', K, N-1, AF( 1, 2 ), LDA, Q( 1, 2 ), LDA )
*
*     Generate the n-by-n matrix Q
*
      SRNAMT = 'csorglq'
      CALL csorglq( N, N, K, Q, LDA, TAU, WORK, LWORK, INFO )
*
      DO 30 ISIDE = 1, 2
         IF( ISIDE.EQ.1 ) THEN
            SIDE = 'L'
            MC = N
            NC = M
         ELSE
            SIDE = 'R'
            MC = M
            NC = N
         END IF
*
*        Generate MC by NC matrix C
*
         DO 10 J = 1, NC
            CALL cslarnv( 2, ISEED, MC, C( 1, J ) )
   10    CONTINUE
         CNORM = SLANGE( '1', MC, NC, C, LDA, RWORK )
         IF( CNORM.EQ.0.0 )
     $      CNORM = ONE
*
         DO 20 ITRANS = 1, 2
            IF( ITRANS.EQ.1 ) THEN
               TRANS = 'N'
            ELSE
               TRANS = 'T'
            END IF
*
*           Copy C
*
            CALL cslacpy( 'Full', MC, NC, C, LDA, CC, LDA )
*
*           Apply Q or Q' to C
*
            SRNAMT = 'csormlq'
            CALL csormlq( SIDE, TRANS, MC, NC, K, AF, LDA, TAU, CC, 
     $  LDA, 
     $                   WORK, LWORK, INFO )
*
*           Form explicit product and subtract
*
            IF( LSAME( SIDE, 'L' ) ) THEN
               CALL SGEMM( TRANS, 'No transpose', MC, NC, MC, -ONE, Q,
     $                     LDA, C, LDA, ONE, CC, LDA )
            ELSE
               CALL SGEMM( 'No transpose', TRANS, MC, NC, NC, -ONE, C,
     $                     LDA, Q, LDA, ONE, CC, LDA )
            END IF
*
*           Compute error in the difference
*
            RESID = SLANGE( '1', MC, NC, CC, LDA, RWORK )
            RESULT( ( ISIDE-1 )*2+ITRANS ) = RESID /
     $         ( REAL( MAX( 1, N ) )*CNORM*EPS )
*
   20    CONTINUE
   30 CONTINUE
*
      RETURN
*
*     End of SLQT03
*
      END
