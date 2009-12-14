      SUBROUTINE ZERRTR( PATH, NUNIT )
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
*  ZERRTR tests the error exits for the COMPLEX*16 triangular routines.
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
      CHARACTER*2        C2
      INTEGER            INFO
      DOUBLE PRECISION   RCOND, SCALE
*     ..
*     .. Local Arrays ..
      DOUBLE PRECISION   R1( NMAX ), R2( NMAX ), RW( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), B( NMAX ), W( NMAX ),
     $                   X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, czlatbs, czlatps, czlatrs, cztbcon,
     $             cztbrfs, cztbtrs, cztpcon, cztprfs, cztptri, cztptrs,
     $                   cztrcon, cztrrfs, cztrti2, cztrtri, cztrtrs
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
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
      A( 1, 1 ) = 1.D0
      A( 1, 2 ) = 2.D0
      A( 2, 2 ) = 3.D0
      A( 2, 1 ) = 4.D0
      OK = .TRUE.
*
*     Test error exits for the general triangular routines.
*
      IF( LSAMEN( 2, C2, 'TR' ) ) THEN
*
*        cztrtri
*
         SRNAMT = 'cztrtri'
         INFOT = 1
         CALL cztrtri( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cztrtri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztrtri( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cztrtri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztrtri( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cztrtri', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztrtri( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cztrtri', INFOT, NOUT, LERR, OK )
*
*        cztrti2
*
         SRNAMT = 'cztrti2'
         INFOT = 1
         CALL cztrti2( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cztrti2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztrti2( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cztrti2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztrti2( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cztrti2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztrti2( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cztrti2', INFOT, NOUT, LERR, OK )
*
*
*        cztrtrs
*
         SRNAMT = 'cztrtrs'
         INFOT = 1
         CALL cztrtrs( '/', 'N', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztrtrs( 'U', '/', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztrtrs( 'U', 'N', '/', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztrtrs( 'U', 'N', 'N', -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztrtrs( 'U', 'N', 'N', 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
*
*        cztrrfs
*
         SRNAMT = 'cztrrfs'
         INFOT = 1
         CALL cztrrfs( '/', 'N', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztrrfs( 'U', '/', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztrrfs( 'U', 'N', '/', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cztrrfs( 'U', 'N', 'N', -1, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cztrrfs( 'U', 'N', 'N', 0, -1, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cztrrfs( 'U', 'N', 'N', 2, 1, A, 1, B, 2, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cztrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 1, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cztrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 2, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztrrfs', INFOT, NOUT, LERR, OK )
*
*        cztrcon
*
         SRNAMT = 'cztrcon'
         INFOT = 1
         CALL cztrcon( '/', 'U', 'N', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztrcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztrcon( '1', '/', 'N', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztrcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztrcon( '1', 'U', '/', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztrcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztrcon( '1', 'U', 'N', -1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztrcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztrcon( '1', 'U', 'N', 2, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztrcon', INFOT, NOUT, LERR, OK )
*
*        czlatrs
*
         SRNAMT = 'czlatrs'
         INFOT = 1
         CALL czlatrs( '/', 'N', 'N', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czlatrs( 'U', '/', 'N', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czlatrs( 'U', 'N', '/', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czlatrs( 'U', 'N', 'N', '/', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czlatrs( 'U', 'N', 'N', 'N', -1, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czlatrs( 'U', 'N', 'N', 'N', 2, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatrs', INFOT, NOUT, LERR, OK )
*
*     Test error exits for the packed triangular routines.
*
      ELSE IF( LSAMEN( 2, C2, 'TP' ) ) THEN
*
*        cztptri
*
         SRNAMT = 'cztptri'
         INFOT = 1
         CALL cztptri( '/', 'N', 0, A, INFO )
         CALL CHKXER( 'cztptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztptri( 'U', '/', 0, A, INFO )
         CALL CHKXER( 'cztptri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztptri( 'U', 'N', -1, A, INFO )
         CALL CHKXER( 'cztptri', INFOT, NOUT, LERR, OK )
*
*        cztptrs
*
         SRNAMT = 'cztptrs'
         INFOT = 1
         CALL cztptrs( '/', 'N', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztptrs( 'U', '/', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztptrs( 'U', 'N', '/', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztptrs( 'U', 'N', 'N', -1, 0, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztptrs( 'U', 'N', 'N', 0, -1, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztptrs( 'U', 'N', 'N', 2, 1, A, X, 1, INFO )
         CALL CHKXER( 'cztptrs', INFOT, NOUT, LERR, OK )
*
*        cztprfs
*
         SRNAMT = 'cztprfs'
         INFOT = 1
        CALL cztprfs( '/', 'N', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cztprfs( 'U', '/', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cztprfs( 'U', 'N', '/', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztprfs( 'U', 'N', 'N', -1, 0, A, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztprfs( 'U', 'N', 'N', 0, -1, A, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cztprfs( 'U', 'N', 'N', 2, 1, A, B, 1, X, 2, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cztprfs( 'U', 'N', 'N', 2, 1, A, B, 2, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cztprfs', INFOT, NOUT, LERR, OK )
*
*        cztpcon
*
         SRNAMT = 'cztpcon'
         INFOT = 1
         CALL cztpcon( '/', 'U', 'N', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztpcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztpcon( '1', '/', 'N', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztpcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztpcon( '1', 'U', '/', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztpcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztpcon( '1', 'U', 'N', -1, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztpcon', INFOT, NOUT, LERR, OK )
*
*        czlatps
*
         SRNAMT = 'czlatps'
         INFOT = 1
         CALL czlatps( '/', 'N', 'N', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatps', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czlatps( 'U', '/', 'N', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatps', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czlatps( 'U', 'N', '/', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatps', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czlatps( 'U', 'N', 'N', '/', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatps', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czlatps( 'U', 'N', 'N', 'N', -1, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'czlatps', INFOT, NOUT, LERR, OK )
*
*     Test error exits for the banded triangular routines.
*
      ELSE IF( LSAMEN( 2, C2, 'TB' ) ) THEN
*
*        cztbtrs
*
         SRNAMT = 'cztbtrs'
         INFOT = 1
         CALL cztbtrs( '/', 'N', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztbtrs( 'U', '/', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztbtrs( 'U', 'N', '/', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztbtrs( 'U', 'N', 'N', -1, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztbtrs( 'U', 'N', 'N', 0, -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cztbtrs( 'U', 'N', 'N', 0, 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztbtrs( 'U', 'N', 'N', 2, 1, 1, A, 1, X, 2, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztbtrs( 'U', 'N', 'N', 2, 0, 1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cztbtrs', INFOT, NOUT, LERR, OK )
*
*        cztbrfs
*
         SRNAMT = 'cztbrfs'
         INFOT = 1
         CALL cztbrfs( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztbrfs( 'U', '/', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztbrfs( 'U', 'N', '/', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cztbrfs( 'U', 'N', 'N', -1, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cztbrfs( 'U', 'N', 'N', 0, -1, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
        INFOT = 6
        CALL cztbrfs( 'U', 'N', 'N', 0, 0, -1, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cztbrfs( 'U', 'N', 'N', 2, 1, 1, A, 1, B, 2, X, 2, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cztbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 1, X, 2, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cztbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 2, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cztbrfs', INFOT, NOUT, LERR, OK )
*
*        cztbcon
*
         SRNAMT = 'cztbcon'
         INFOT = 1
         CALL cztbcon( '/', 'U', 'N', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztbcon( '1', '/', 'N', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cztbcon( '1', 'U', '/', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztbcon( '1', 'U', 'N', -1, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cztbcon( '1', 'U', 'N', 0, -1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cztbcon( '1', 'U', 'N', 2, 1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cztbcon', INFOT, NOUT, LERR, OK )
*
*        czlatbs
*
         SRNAMT = 'czlatbs'
         INFOT = 1
         CALL czlatbs( '/', 'N', 'N', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czlatbs( 'U', '/', 'N', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czlatbs( 'U', 'N', '/', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czlatbs( 'U', 'N', 'N', '/', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czlatbs( 'U', 'N', 'N', 'N', -1, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czlatbs( 'U', 'N', 'N', 'N', 1, -1, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czlatbs( 'U', 'N', 'N', 'N', 2, 1, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'czlatbs', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRTR
*
      END
