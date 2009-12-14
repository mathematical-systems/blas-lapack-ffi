      SUBROUTINE CERRTR( PATH, NUNIT )
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
*  CERRTR tests the error exits for the COMPLEX triangular routines.
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
      REAL               RCOND, SCALE
*     ..
*     .. Local Arrays ..
      REAL               R1( NMAX ), R2( NMAX ), RW( NMAX )
      COMPLEX            A( NMAX, NMAX ), B( NMAX ), W( NMAX ),
     $                   X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, cclatbs, cclatps, cclatrs, cctbcon,
     $             cctbrfs, cctbtrs, cctpcon, cctprfs, cctptri, cctptrs,
     $                   cctrcon, cctrrfs, cctrti2, cctrtri, cctrtrs
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
      A( 1, 1 ) = 1.
      A( 1, 2 ) = 2.
      A( 2, 2 ) = 3.
      A( 2, 1 ) = 4.
      OK = .TRUE.
*
*     Test error exits for the general triangular routines.
*
      IF( LSAMEN( 2, C2, 'TR' ) ) THEN
*
*        cctrtri
*
         SRNAMT = 'cctrtri'
         INFOT = 1
         CALL cctrtri( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cctrtri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrtri( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cctrtri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctrtri( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cctrtri', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctrtri( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cctrtri', INFOT, NOUT, LERR, OK )
*
*        cctrti2
*
         SRNAMT = 'cctrti2'
         INFOT = 1
         CALL cctrti2( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cctrti2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrti2( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cctrti2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctrti2( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cctrti2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctrti2( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cctrti2', INFOT, NOUT, LERR, OK )
*
*
*        cctrtrs
*
         SRNAMT = 'cctrtrs'
         INFOT = 1
         CALL cctrtrs( '/', 'N', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrtrs( 'U', '/', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctrtrs( 'U', 'N', '/', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctrtrs( 'U', 'N', 'N', -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctrtrs( 'U', 'N', 'N', 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
*
*        cctrrfs
*
         SRNAMT = 'cctrrfs'
         INFOT = 1
         CALL cctrrfs( '/', 'N', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrrfs( 'U', '/', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctrrfs( 'U', 'N', '/', 0, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cctrrfs( 'U', 'N', 'N', -1, 0, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cctrrfs( 'U', 'N', 'N', 0, -1, A, 1, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cctrrfs( 'U', 'N', 'N', 2, 1, A, 1, B, 2, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cctrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 1, X, 2, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cctrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 2, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrrfs', INFOT, NOUT, LERR, OK )
*
*        cctrcon
*
         SRNAMT = 'cctrcon'
         INFOT = 1
         CALL cctrcon( '/', 'U', 'N', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctrcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrcon( '1', '/', 'N', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctrcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctrcon( '1', 'U', '/', 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctrcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctrcon( '1', 'U', 'N', -1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctrcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cctrcon( '1', 'U', 'N', 2, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctrcon', INFOT, NOUT, LERR, OK )
*
*        cclatrs
*
         SRNAMT = 'cclatrs'
         INFOT = 1
         CALL cclatrs( '/', 'N', 'N', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cclatrs( 'U', '/', 'N', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cclatrs( 'U', 'N', '/', 'N', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cclatrs( 'U', 'N', 'N', '/', 0, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cclatrs( 'U', 'N', 'N', 'N', -1, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cclatrs( 'U', 'N', 'N', 'N', 2, A, 1, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatrs', INFOT, NOUT, LERR, OK )
*
*     Test error exits for the packed triangular routines.
*
      ELSE IF( LSAMEN( 2, C2, 'TP' ) ) THEN
*
*        cctptri
*
         SRNAMT = 'cctptri'
         INFOT = 1
         CALL cctptri( '/', 'N', 0, A, INFO )
         CALL CHKXER( 'cctptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctptri( 'U', '/', 0, A, INFO )
         CALL CHKXER( 'cctptri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctptri( 'U', 'N', -1, A, INFO )
         CALL CHKXER( 'cctptri', INFOT, NOUT, LERR, OK )
*
*        cctptrs
*
         SRNAMT = 'cctptrs'
         INFOT = 1
         CALL cctptrs( '/', 'N', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctptrs( 'U', '/', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctptrs( 'U', 'N', '/', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctptrs( 'U', 'N', 'N', -1, 0, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctptrs( 'U', 'N', 'N', 0, -1, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cctptrs( 'U', 'N', 'N', 2, 1, A, X, 1, INFO )
         CALL CHKXER( 'cctptrs', INFOT, NOUT, LERR, OK )
*
*        cctprfs
*
         SRNAMT = 'cctprfs'
         INFOT = 1
        CALL cctprfs( '/', 'N', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cctprfs( 'U', '/', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cctprfs( 'U', 'N', '/', 0, 0, A, B, 1, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctprfs( 'U', 'N', 'N', -1, 0, A, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctprfs( 'U', 'N', 'N', 0, -1, A, B, 1, X, 1, R1, R2, W,
     $                RW, INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
        CALL cctprfs( 'U', 'N', 'N', 2, 1, A, B, 1, X, 2, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL cctprfs( 'U', 'N', 'N', 2, 1, A, B, 2, X, 1, R1, R2, W, RW,
     $                INFO )
         CALL CHKXER( 'cctprfs', INFOT, NOUT, LERR, OK )
*
*        cctpcon
*
         SRNAMT = 'cctpcon'
         INFOT = 1
         CALL cctpcon( '/', 'U', 'N', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctpcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctpcon( '1', '/', 'N', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctpcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctpcon( '1', 'U', '/', 0, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctpcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctpcon( '1', 'U', 'N', -1, A, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctpcon', INFOT, NOUT, LERR, OK )
*
*        cclatps
*
         SRNAMT = 'cclatps'
         INFOT = 1
         CALL cclatps( '/', 'N', 'N', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatps', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cclatps( 'U', '/', 'N', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatps', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cclatps( 'U', 'N', '/', 'N', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatps', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cclatps( 'U', 'N', 'N', '/', 0, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatps', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cclatps( 'U', 'N', 'N', 'N', -1, A, X, SCALE, RW, INFO )
         CALL CHKXER( 'cclatps', INFOT, NOUT, LERR, OK )
*
*     Test error exits for the banded triangular routines.
*
      ELSE IF( LSAMEN( 2, C2, 'TB' ) ) THEN
*
*        cctbtrs
*
         SRNAMT = 'cctbtrs'
         INFOT = 1
         CALL cctbtrs( '/', 'N', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctbtrs( 'U', '/', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctbtrs( 'U', 'N', '/', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctbtrs( 'U', 'N', 'N', -1, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctbtrs( 'U', 'N', 'N', 0, -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cctbtrs( 'U', 'N', 'N', 0, 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cctbtrs( 'U', 'N', 'N', 2, 1, 1, A, 1, X, 2, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cctbtrs( 'U', 'N', 'N', 2, 0, 1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cctbtrs', INFOT, NOUT, LERR, OK )
*
*        cctbrfs
*
         SRNAMT = 'cctbrfs'
         INFOT = 1
         CALL cctbrfs( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctbrfs( 'U', '/', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctbrfs( 'U', 'N', '/', 0, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL cctbrfs( 'U', 'N', 'N', -1, 0, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL cctbrfs( 'U', 'N', 'N', 0, -1, 0, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 6
        CALL cctbrfs( 'U', 'N', 'N', 0, 0, -1, A, 1, B, 1, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cctbrfs( 'U', 'N', 'N', 2, 1, 1, A, 1, B, 2, X, 2, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cctbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 1, X, 2, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cctbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 2, X, 1, R1, R2,
     $                W, RW, INFO )
         CALL CHKXER( 'cctbrfs', INFOT, NOUT, LERR, OK )
*
*        cctbcon
*
         SRNAMT = 'cctbcon'
         INFOT = 1
         CALL cctbcon( '/', 'U', 'N', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctbcon( '1', '/', 'N', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cctbcon( '1', 'U', '/', 0, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctbcon( '1', 'U', 'N', -1, 0, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cctbcon( '1', 'U', 'N', 0, -1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cctbcon( '1', 'U', 'N', 2, 1, A, 1, RCOND, W, RW, INFO )
         CALL CHKXER( 'cctbcon', INFOT, NOUT, LERR, OK )
*
*        cclatbs
*
         SRNAMT = 'cclatbs'
         INFOT = 1
         CALL cclatbs( '/', 'N', 'N', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cclatbs( 'U', '/', 'N', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cclatbs( 'U', 'N', '/', 'N', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cclatbs( 'U', 'N', 'N', '/', 0, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cclatbs( 'U', 'N', 'N', 'N', -1, 0, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cclatbs( 'U', 'N', 'N', 'N', 1, -1, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cclatbs( 'U', 'N', 'N', 'N', 2, 1, A, 1, X, SCALE, RW,
     $                INFO )
         CALL CHKXER( 'cclatbs', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRTR
*
      END
