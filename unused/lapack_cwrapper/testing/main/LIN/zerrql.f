      SUBROUTINE ZERRQL( PATH, NUNIT )
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
*  ZERRQL tests the error exits for the COMPLEX*16 routines
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
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, CHKXER, czgeql2, czgeqlf, ZGEQLS, czung2l,
     $                   czungql, czunm2l, czunmql
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
*     Error exits for QL factorization
*
*     czgeqlf
*
      SRNAMT = 'czgeqlf'
      INFOT = 1
      CALL czgeqlf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgeqlf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgeqlf( 2, 1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqlf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czgeqlf( 1, 2, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgeqlf', INFOT, NOUT, LERR, OK )
*
*     czgeql2
*
      SRNAMT = 'czgeql2'
      INFOT = 1
      CALL czgeql2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgeql2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeql2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgeql2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgeql2', INFOT, NOUT, LERR, OK )
*
*     ZGEQLS
*
      SRNAMT = 'ZGEQLS'
      INFOT = 1
      CALL ZGEQLS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGEQLS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGEQLS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ZGEQLS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ZGEQLS( 2, 1, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ZGEQLS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ZGEQLS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGEQLS', INFOT, NOUT, LERR, OK )
*
*     czungql
*
      SRNAMT = 'czungql'
      INFOT = 1
      CALL czungql( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungql( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungql( 1, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungql( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungql( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czungql( 2, 1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL czungql( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'czungql', INFOT, NOUT, LERR, OK )
*
*     czung2l
*
      SRNAMT = 'czung2l'
      INFOT = 1
      CALL czung2l( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czung2l( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czung2l( 1, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czung2l( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czung2l( 2, 1, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czung2l( 2, 1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czung2l', INFOT, NOUT, LERR, OK )
*
*     czunmql
*
      SRNAMT = 'czunmql'
      INFOT = 1
      CALL czunmql( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunmql( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunmql( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunmql( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmql( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmql( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmql( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmql( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmql( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunmql( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmql( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmql( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmql', INFOT, NOUT, LERR, OK )
*
*     czunm2l
*
      SRNAMT = 'czunm2l'
      INFOT = 1
      CALL czunm2l( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunm2l( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunm2l( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunm2l( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2l( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2l( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunm2l( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunm2l( 'L', 'N', 2, 1, 0, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunm2l( 'R', 'N', 1, 2, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunm2l( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunm2l', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRQL
*
      END
