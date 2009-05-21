      SUBROUTINE ZERRRQ( PATH, NUNIT )
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
*  ZERRRQ tests the error exits for the COMPLEX*16 routines
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
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( NMAX ), X( NMAX )
*     ..
*     .. External Subroutines ..
      EXTERNAL        ALAESM, CHKXER, czgerq2, czgerqf, ZGERQS, czungr2,
     $                   czungrq, czunmr2, czunmrq
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
*     Error exits for RQ factorization
*
*     czgerqf
*
      SRNAMT = 'czgerqf'
      INFOT = 1
      CALL czgerqf( -1, 0, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgerqf( 0, -1, A, 1, B, W, 1, INFO )
      CALL CHKXER( 'czgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgerqf( 2, 1, A, 1, B, W, 2, INFO )
      CALL CHKXER( 'czgerqf', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czgerqf( 2, 1, A, 2, B, W, 1, INFO )
      CALL CHKXER( 'czgerqf', INFOT, NOUT, LERR, OK )
*
*     czgerq2
*
      SRNAMT = 'czgerq2'
      INFOT = 1
      CALL czgerq2( -1, 0, A, 1, B, W, INFO )
      CALL CHKXER( 'czgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czgerq2( 0, -1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgerq2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czgerq2( 2, 1, A, 1, B, W, INFO )
      CALL CHKXER( 'czgerq2', INFOT, NOUT, LERR, OK )
*
*     ZGERQS
*
      SRNAMT = 'ZGERQS'
      INFOT = 1
      CALL ZGERQS( -1, 0, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGERQS( 0, -1, 0, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL ZGERQS( 2, 1, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL ZGERQS( 0, 0, -1, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL ZGERQS( 2, 2, 0, A, 1, X, B, 2, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL ZGERQS( 2, 2, 0, A, 2, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL ZGERQS( 1, 1, 2, A, 1, X, B, 1, W, 1, INFO )
      CALL CHKXER( 'ZGERQS', INFOT, NOUT, LERR, OK )
*
*     czungrq
*
      SRNAMT = 'czungrq'
      INFOT = 1
      CALL czungrq( -1, 0, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungrq( 0, -1, 0, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungrq( 2, 1, 0, A, 2, X, W, 2, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungrq( 0, 0, -1, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungrq( 1, 2, 2, A, 1, X, W, 1, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czungrq( 2, 2, 0, A, 1, X, W, 2, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
      INFOT = 8
      CALL czungrq( 2, 2, 0, A, 2, X, W, 1, INFO )
      CALL CHKXER( 'czungrq', INFOT, NOUT, LERR, OK )
*
*     czungr2
*
      SRNAMT = 'czungr2'
      INFOT = 1
      CALL czungr2( -1, 0, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungr2( 0, -1, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czungr2( 2, 1, 0, A, 2, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungr2( 0, 0, -1, A, 1, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czungr2( 1, 2, 2, A, 2, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czungr2( 2, 2, 0, A, 1, X, W, INFO )
      CALL CHKXER( 'czungr2', INFOT, NOUT, LERR, OK )
*
*     czunmrq
*
      SRNAMT = 'czunmrq'
      INFOT = 1
      CALL czunmrq( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunmrq( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunmrq( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunmrq( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmrq( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmrq( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmrq( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmrq( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmrq( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunmrq( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmrq( 'L', 'N', 1, 2, 0, A, 1, X, AF, 1, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
      INFOT = 12
      CALL czunmrq( 'R', 'N', 2, 1, 0, A, 1, X, AF, 2, W, 1, INFO )
      CALL CHKXER( 'czunmrq', INFOT, NOUT, LERR, OK )
*
*     czunmr2
*
      SRNAMT = 'czunmr2'
      INFOT = 1
      CALL czunmr2( '/', 'N', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 2
      CALL czunmr2( 'L', '/', 0, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 3
      CALL czunmr2( 'L', 'N', -1, 0, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 4
      CALL czunmr2( 'L', 'N', 0, -1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmr2( 'L', 'N', 0, 0, -1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmr2( 'L', 'N', 0, 1, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 5
      CALL czunmr2( 'R', 'N', 1, 0, 1, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmr2( 'L', 'N', 2, 1, 2, A, 1, X, AF, 2, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 7
      CALL czunmr2( 'R', 'N', 1, 2, 2, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
      INFOT = 10
      CALL czunmr2( 'L', 'N', 2, 1, 0, A, 1, X, AF, 1, W, INFO )
      CALL CHKXER( 'czunmr2', INFOT, NOUT, LERR, OK )
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRRQ
*
      END
