      SUBROUTINE SERRQL( PATH, NUNIT )
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
*  SERRQL tests the error exits for the REAL routines
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
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgeql2, csgeqlf, SGEQLS, 
     $  csorg2l, 
     $                   csorgql, csorm2l, csormql
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
*     Error exits for QL factorization
*
*     csgeqlf
*
      SRNAMT = 'csgeqlf'
      INFOT = 1
      CALL csgeqlf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgeqlf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgeqlf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csgeqlf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqlf', INFOT, NOUT, LERR, OK )
*
*     csgeql2
*
      SRNAMT = 'csgeql2'
      INFOT = 1
      CALL csgeql2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgeql2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgeql2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeql2', INFOT, NOUT, LERR, OK )
*
*     SGEQLS
*
      SRNAMT = 'SGEQLS'
      INFOT = 1
      CALL SGEQLS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGEQLS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGEQLS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL SGEQLS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL SGEQLS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL SGEQLS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL SGEQLS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQLS', INFOT, NOUT, LERR, OK )
*
*     csorgql
*
      SRNAMT = 'csorgql'
      INFOT = 1
      CALL csorgql( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgql( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgql( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgql( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgql( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorgql( 2, 1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL csorgql( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'csorgql', INFOT, NOUT, LERR, OK )
*
*     csorg2l
*
      SRNAMT = 'csorg2l'
      INFOT = 1
      CALL csorg2l( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorg2l( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorg2l( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorg2l( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorg2l( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorg2l( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2l', INFOT, NOUT, LERR, OK )
*
*     csormql
*
      SRNAMT = 'csormql'
      INFOT = 1
      CALL csormql( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csormql( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csormql( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csormql( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormql( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormql( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormql( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormql( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormql( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csormql( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormql( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormql( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormql', INFOT, NOUT, LERR, OK )
*
*     csorm2l
*
      SRNAMT = 'csorm2l'
      INFOT = 1
      CALL csorm2l( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorm2l( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorm2l( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csorm2l( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2l( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2l( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2l( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorm2l( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorm2l( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csorm2l( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2l', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRQL
*
      END
