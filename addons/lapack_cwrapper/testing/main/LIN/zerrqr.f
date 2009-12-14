      SUBROUTINE ZERRQR( PATH, NUNIT )
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
*  ZERRQR tests the error exits for the COMPLEX*16 routines
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
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, CHKXER, czgeqr2, czgeqrf, ZGEQRS, czung2r,
     $                   czungqr, czunm2r, czunmqr
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
      INTRINSIC          DBLE, DCMPLX
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
            A( I, J ) = DCMPLX( 1.D0 / DBLE( I+J ),
     $                  -1.D0 / DBLE( I+J ) )
            AF( I, J ) = DCMPLX( 1.D0 / DBLE( I+J ),
     $                   -1.D0 / DBLE( I+J ) )
   10    CONTINUE
         B( J ) = 0.D0
         W( J ) = 0.D0
         X( J ) = 0.D0
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for QR factorization
*
*     czgeqrf
*
      SRNAMT = 'czgeqrf'
      INFOT = 1
      CALL czgeqrf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgeqrf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgeqrf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqrf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czgeqrf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqrf', INFOT, NOUT, LERR, OK )
*
*     czgeqr2
*
      SRNAMT = 'czgeqr2'
      INFOT = 1
      CALL czgeqr2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgeqr2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeqr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgeqr2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeqr2', INFOT, NOUT, LERR, OK )
*
*     ZGEQRS
*
      SRNAMT = 'ZGEQRS'
      INFOT = 1
      CALL ZGEQRS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGEQRS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGEQRS( 1, 2, 0, A, 2, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ZGEQRS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ZGEQRS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ZGEQRS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ZGEQRS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQRS', INFOT, NOUT, LERR, OK )
*
*     czungqr
*
      SRNAMT = 'czungqr'
      INFOT = 1
      CALL czungqr( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungqr( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungqr( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungqr( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungqr( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czungqr( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL czungqr( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'czungqr', INFOT, NOUT, LERR, OK )
*
*     czung2r
*
      SRNAMT = 'czung2r'
      INFOT = 1
      CALL czung2r( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czung2r( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czung2r( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czung2r( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czung2r( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czung2r( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2r', INFOT, NOUT, LERR, OK )
*
*     czunmqr
*
      SRNAMT = 'czunmqr'
      INFOT = 1
      CALL czunmqr( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunmqr( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunmqr( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunmqr( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmqr( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmqr( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmqr( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmqr( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmqr( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunmqr( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmqr( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmqr( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmqr', INFOT, NOUT, LERR, OK )
*
*     czunm2r
*
      SRNAMT = 'czunm2r'
      INFOT = 1
      CALL czunm2r( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunm2r( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunm2r( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunm2r( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2r( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2r( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2r( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunm2r( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunm2r( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunm2r( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2r', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRQR
*
      END
