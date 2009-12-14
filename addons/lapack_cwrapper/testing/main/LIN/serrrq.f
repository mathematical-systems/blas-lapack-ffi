      SUBROUTINE SERRRQ( PATH, NUNIT )
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
*  SERRRQ tests the error exits for the REAL routines
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
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgerq2, csgerqf, SGERQS, 
     $  csorgr2, 
     $                   csorgrq, csormr2, csormrq
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
      INTRINSIC          REAL
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
            A( I, J ) = 1. / REAL( I+J )
            AF( I, J ) = 1. / REAL( I+J )
   10    CONTINUE
         B( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for RQ factorization
*
*     csgerqf
*
      SRNAMT = 'csgerqf'
      INFOT = 1
      CALL csgerqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgerqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgerqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'csgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csgerqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'csgerqf', INFOT, NOUT, LERR, OK )
*
*     csgerq2
*
      SRNAMT = 'csgerq2'
      INFOT = 1
      CALL csgerq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'csgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgerq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgerq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgerq2', INFOT, NOUT, LERR, OK )
*
*     SGERQS
*
      SRNAMT = 'SGERQS'
      INFOT = 1
      CALL SGERQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGERQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGERQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL SGERQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL SGERQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL SGERQS( 2, 2, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL SGERQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGERQS', INFOT, NOUT, LERR, OK )
*
*     csorgrq
*
      SRNAMT = 'csorgrq'
      INFOT = 1
      CALL csorgrq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgrq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgrq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgrq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgrq( 1, 2, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorgrq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL csorgrq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'csorgrq', INFOT, NOUT, LERR, OK )
*
*     csorgr2
*
      SRNAMT = 'csorgr2'
      INFOT = 1
      CALL csorgr2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgr2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgr2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgr2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgr2( 1, 2, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorgr2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorgr2', INFOT, NOUT, LERR, OK )
*
*     csormrq
*
      SRNAMT = 'csormrq'
      INFOT = 1
      CALL csormrq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csormrq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csormrq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csormrq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormrq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormrq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormrq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormrq( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormrq( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csormrq( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormrq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormrq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormrq', INFOT, NOUT, LERR, OK )
*
*     csormr2
*
      SRNAMT = 'csormr2'
      INFOT = 1
      CALL csormr2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csormr2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csormr2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csormr2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormr2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormr2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormr2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormr2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormr2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csormr2( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csormr2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRRQ
*
      END
