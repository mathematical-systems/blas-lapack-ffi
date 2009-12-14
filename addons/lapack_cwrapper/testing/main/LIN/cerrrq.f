      SUBROUTINE CERRRQ( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  CERRRQ tests the error exits for the COMPLEX routines
*  that use the RQ decomposition of a general matrix.
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
      PARAMETER          ( NMAX = 2 )
*     ..
*     .. Local Scalars ..
      INTEGER            I, INFO, J
*     ..
*     .. Local Arrays ..
      COMPLEX            A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, ccgerq2, ccgerqf, CGERQS, CHKXER, ccungr2,
     $                   ccungrq, ccunmr2, ccunmrq
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
      INTRINSIC          CMPLX, REAL
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
            AF( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
   10    CONTINUE
         B( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for RQ factorization
*
*     ccgerqf
*
      SRNAMT = 'ccgerqf'
      INFOT = 1
      CALL ccgerqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgerqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgerqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'ccgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccgerqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'ccgerqf', INFOT, NOUT, LERR, OK )
*
*     ccgerq2
*
      SRNAMT = 'ccgerq2'
      INFOT = 1
      CALL ccgerq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgerq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgerq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgerq2', INFOT, NOUT, LERR, OK )
*
*     CGERQS
*
      SRNAMT = 'CGERQS'
      INFOT = 1
      CALL CGERQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGERQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGERQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL CGERQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL CGERQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL CGERQS( 2, 2, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL CGERQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGERQS', INFOT, NOUT, LERR, OK )
*
*     ccungrq
*
      SRNAMT = 'ccungrq'
      INFOT = 1
      CALL ccungrq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungrq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungrq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungrq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungrq( 1, 2, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccungrq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ccungrq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'ccungrq', INFOT, NOUT, LERR, OK )
*
*     ccungr2
*
      SRNAMT = 'ccungr2'
      INFOT = 1
      CALL ccungr2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungr2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungr2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungr2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungr2( 1, 2, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccungr2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccungr2', INFOT, NOUT, LERR, OK )
*
*     ccunmrq
*
      SRNAMT = 'ccunmrq'
      INFOT = 1
      CALL ccunmrq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunmrq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunmrq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunmrq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmrq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmrq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmrq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmrq( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmrq( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunmrq( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmrq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmrq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmrq', INFOT, NOUT, LERR, OK )
*
*     ccunmr2
*
      SRNAMT = 'ccunmr2'
      INFOT = 1
      CALL ccunmr2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunmr2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunmr2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunmr2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmr2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmr2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmr2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmr2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmr2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunmr2( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunmr2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRRQ
*
      END
