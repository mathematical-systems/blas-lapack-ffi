      SUBROUTINE ZERRLQ( PATH, NUNIT )
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
*  ZERRLQ tests the error exits for the COMPLEX*16 routines
*  that use the LQ decomposition of a general matrix.
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
      EXTERNAL        ALAESM, CHKXER, czgelq2, czgelqf, ZGELQS, czungl2,
     $                   czunglq, czunml2, czunmlq
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
*     Error exits for LQ factorization
*
*     czgelqf
*
      SRNAMT = 'czgelqf'
      INFOT = 1
      CALL czgelqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgelqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgelqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'czgelqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czgelqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'czgelqf', INFOT, NOUT, LERR, OK )
*
*     czgelq2
*
      SRNAMT = 'czgelq2'
      INFOT = 1
      CALL czgelq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'czgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgelq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgelq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgelq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgelq2', INFOT, NOUT, LERR, OK )
*
*     ZGELQS
*
      SRNAMT = 'ZGELQS'
      INFOT = 1
      CALL ZGELQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGELQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGELQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ZGELQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ZGELQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ZGELQS( 1, 2, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ZGELQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGELQS', INFOT, NOUT, LERR, OK )
*
*     czunglq
*
      SRNAMT = 'czunglq'
      INFOT = 1
      CALL czunglq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunglq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunglq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunglq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunglq( 1, 1, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunglq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL czunglq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'czunglq', INFOT, NOUT, LERR, OK )
*
*     czungl2
*
      SRNAMT = 'czungl2'
      INFOT = 1
      CALL czungl2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungl2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungl2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungl2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungl2( 1, 1, 2, A, 1, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czungl2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungl2', INFOT, NOUT, LERR, OK )
*
*     czunmlq
*
      SRNAMT = 'czunmlq'
      INFOT = 1
      CALL czunmlq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunmlq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunmlq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunmlq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmlq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmlq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmlq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmlq( 'L', 'N', 2, 0, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmlq( 'R', 'N', 0, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunmlq( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmlq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmlq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmlq', INFOT, NOUT, LERR, OK )
*
*     czunml2
*
      SRNAMT = 'czunml2'
      INFOT = 1
      CALL czunml2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunml2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunml2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunml2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunml2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunml2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunml2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunml2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunml2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunml2( 'L', 'N', 2, 1, 0, A, 2, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunml2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRLQ
*
      END
