      SUBROUTINE CERRQL( PATH, NUNIT )
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
*  CERRQL tests the error exits for the COMPLEX routines
*  that use the QL decomposition of a general matrix.
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
      EXTERNAL        ALAESM, ccgeql2, ccgeqlf, CGEQLS, CHKXER, ccung2l,
     $                   ccungql, ccunm2l, ccunmql
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
*     Error exits for QL factorization
*
*     ccgeqlf
*
      SRNAMT = 'ccgeqlf'
      INFOT = 1
      CALL ccgeqlf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgeqlf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgeqlf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccgeqlf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'ccgeqlf', INFOT, NOUT, LERR, OK )
*
*     ccgeql2
*
      SRNAMT = 'ccgeql2'
      INFOT = 1
      CALL ccgeql2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccgeql2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccgeql2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'ccgeql2', INFOT, NOUT, LERR, OK )
*
*     CGEQLS
*
      SRNAMT = 'CGEQLS'
      INFOT = 1
      CALL CGEQLS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGEQLS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL CGEQLS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL CGEQLS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL CGEQLS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL CGEQLS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL CGEQLS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'CGEQLS', INFOT, NOUT, LERR, OK )
*
*     ccungql
*
      SRNAMT = 'ccungql'
      INFOT = 1
      CALL ccungql( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungql( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccungql( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungql( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccungql( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccungql( 2, 1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ccungql( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'ccungql', INFOT, NOUT, LERR, OK )
*
*     ccung2l
*
      SRNAMT = 'ccung2l'
      INFOT = 1
      CALL ccung2l( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccung2l( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccung2l( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccung2l( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccung2l( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccung2l( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'ccung2l', INFOT, NOUT, LERR, OK )
*
*     ccunmql
*
      SRNAMT = 'ccunmql'
      INFOT = 1
      CALL ccunmql( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunmql( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunmql( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunmql( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmql( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmql( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunmql( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmql( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunmql( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunmql( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmql( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL ccunmql( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'ccunmql', INFOT, NOUT, LERR, OK )
*
*     ccunm2l
*
      SRNAMT = 'ccunm2l'
      INFOT = 1
      CALL ccunm2l( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ccunm2l( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ccunm2l( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL ccunm2l( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2l( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2l( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ccunm2l( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunm2l( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL ccunm2l( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ccunm2l( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'ccunm2l', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRQL
*
      END
