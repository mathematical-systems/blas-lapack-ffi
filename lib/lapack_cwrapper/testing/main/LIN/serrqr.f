      SUBROUTINE SERRQR( PATH, NUNIT )
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
*  SERRQR tests the error exits for the REAL routines
*  that use the QR decomposition of a general matrix.
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
      EXTERNAL           ALAESM, CHKXER, csgeqr2, csgeqrf, SGEQRS, 
     $  csorg2r, 
     $                   csorgqr, csorm2r, csormqr
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
*     Error exits for QR factorization
*
*     csgeqrf
*
      SRNAMT = 'csgeqrf'
      INFOT = 1
      CALL csgeqrf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgeqrf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgeqrf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csgeqrf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'csgeqrf', INFOT, NOUT, LERR, OK )
*
*     csgeqr2
*
      SRNAMT = 'csgeqr2'
      INFOT = 1
      CALL csgeqr2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csgeqr2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csgeqr2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'csgeqr2', INFOT, NOUT, LERR, OK )
*
*     SGEQRS
*
      SRNAMT = 'SGEQRS'
      INFOT = 1
      CALL SGEQRS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGEQRS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL SGEQRS( 1, 2, 0, A, 2, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL SGEQRS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL SGEQRS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL SGEQRS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL SGEQRS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'SGEQRS', INFOT, NOUT, LERR, OK )
*
*     csorgqr
*
      SRNAMT = 'csorgqr'
      INFOT = 1
      CALL csorgqr( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgqr( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorgqr( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgqr( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorgqr( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorgqr( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL csorgqr( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'csorgqr', INFOT, NOUT, LERR, OK )
*
*     csorg2r
*
      SRNAMT = 'csorg2r'
      INFOT = 1
      CALL csorg2r( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorg2r( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorg2r( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorg2r( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorg2r( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorg2r( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'csorg2r', INFOT, NOUT, LERR, OK )
*
*     csormqr
*
      SRNAMT = 'csormqr'
      INFOT = 1
      CALL csormqr( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csormqr( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csormqr( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csormqr( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormqr( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormqr( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csormqr( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormqr( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csormqr( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csormqr( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormqr( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL csormqr( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'csormqr', INFOT, NOUT, LERR, OK )
*
*     csorm2r
*
      SRNAMT = 'csorm2r'
      INFOT = 1
      CALL csorm2r( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL csorm2r( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL csorm2r( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL csorm2r( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2r( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2r( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL csorm2r( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorm2r( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL csorm2r( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL csorm2r( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'csorm2r', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRQR
*
      END
