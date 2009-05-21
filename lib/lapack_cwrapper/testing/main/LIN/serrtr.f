      SUBROUTINE SERRTR( PATH, NUNIT )
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
*  SERRTR tests the error exits for the REAL triangular
*  routines.
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
      INTEGER            IW( NMAX )
      REAL               A( NMAX, NMAX ), B( NMAX ), R1( NMAX ),
     $                   R2( NMAX ), W( NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, cslatbs, cslatps, cslatrs, 
     $  cstbcon, 
     $                   cstbrfs, cstbtrs, cstpcon, cstprfs, cstptri, 
     $  cstptrs, 
     $                   cstrcon, cstrrfs, cstrti2, cstrtri, cstrtrs
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
      IF( LSAMEN( 2, C2, 'TR' ) ) THEN
*
*        Test error exits for the general triangular routines.
*
*        cstrtri
*
         SRNAMT = 'cstrtri'
         INFOT = 1
         CALL cstrtri( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cstrtri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrtri( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cstrtri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstrtri( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cstrtri', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstrtri( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cstrtri', INFOT, NOUT, LERR, OK )
*
*        cstrti2
*
         SRNAMT = 'cstrti2'
         INFOT = 1
         CALL cstrti2( '/', 'N', 0, A, 1, INFO )
         CALL CHKXER( 'cstrti2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrti2( 'U', '/', 0, A, 1, INFO )
         CALL CHKXER( 'cstrti2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstrti2( 'U', 'N', -1, A, 1, INFO )
         CALL CHKXER( 'cstrti2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstrti2( 'U', 'N', 2, A, 1, INFO )
         CALL CHKXER( 'cstrti2', INFOT, NOUT, LERR, OK )
*
*        cstrtrs
*
         SRNAMT = 'cstrtrs'
         INFOT = 1
         CALL cstrtrs( '/', 'N', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrtrs( 'U', '/', 'N', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstrtrs( 'U', 'N', '/', 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstrtrs( 'U', 'N', 'N', -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstrtrs( 'U', 'N', 'N', 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cstrtrs( 'U', 'N', 'N', 2, 1, A, 1, X, 2, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cstrtrs( 'U', 'N', 'N', 2, 1, A, 2, X, 1, INFO )
         CALL CHKXER( 'cstrtrs', INFOT, NOUT, LERR, OK )
*
*        cstrrfs
*
         SRNAMT = 'cstrrfs'
         INFOT = 1
         CALL cstrrfs( '/', 'N', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrrfs( 'U', '/', 'N', 0, 0, A, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstrrfs( 'U', 'N', '/', 0, 0, A, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstrrfs( 'U', 'N', 'N', -1, 0, A, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstrrfs( 'U', 'N', 'N', 0, -1, A, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cstrrfs( 'U', 'N', 'N', 2, 1, A, 1, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cstrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 1, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cstrrfs( 'U', 'N', 'N', 2, 1, A, 2, B, 2, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cstrrfs', INFOT, NOUT, LERR, OK )
*
*        cstrcon
*
         SRNAMT = 'cstrcon'
         INFOT = 1
         CALL cstrcon( '/', 'U', 'N', 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstrcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrcon( '1', '/', 'N', 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstrcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstrcon( '1', 'U', '/', 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstrcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstrcon( '1', 'U', 'N', -1, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstrcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstrcon( '1', 'U', 'N', 2, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstrcon', INFOT, NOUT, LERR, OK )
*
*        cslatrs
*
         SRNAMT = 'cslatrs'
         INFOT = 1
         CALL cslatrs( '/', 'N', 'N', 'N', 0, A, 1, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cslatrs( 'U', '/', 'N', 'N', 0, A, 1, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cslatrs( 'U', 'N', '/', 'N', 0, A, 1, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cslatrs( 'U', 'N', 'N', '/', 0, A, 1, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cslatrs( 'U', 'N', 'N', 'N', -1, A, 1, X, SCALE, W, INFO 
     $  ) 
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cslatrs( 'U', 'N', 'N', 'N', 2, A, 1, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatrs', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'TP' ) ) THEN
*
*        Test error exits for the packed triangular routines.
*
*        cstptri
*
         SRNAMT = 'cstptri'
         INFOT = 1
         CALL cstptri( '/', 'N', 0, A, INFO )
         CALL CHKXER( 'cstptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstptri( 'U', '/', 0, A, INFO )
         CALL CHKXER( 'cstptri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstptri( 'U', 'N', -1, A, INFO )
         CALL CHKXER( 'cstptri', INFOT, NOUT, LERR, OK )
*
*        cstptrs
*
         SRNAMT = 'cstptrs'
         INFOT = 1
         CALL cstptrs( '/', 'N', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstptrs( 'U', '/', 'N', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstptrs( 'U', 'N', '/', 0, 0, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstptrs( 'U', 'N', 'N', -1, 0, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstptrs( 'U', 'N', 'N', 0, -1, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstptrs( 'U', 'N', 'N', 2, 1, A, X, 1, INFO )
         CALL CHKXER( 'cstptrs', INFOT, NOUT, LERR, OK )
*
*        cstprfs
*
         SRNAMT = 'cstprfs'
         INFOT = 1
         CALL cstprfs( '/', 'N', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstprfs( 'U', '/', 'N', 0, 0, A, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstprfs( 'U', 'N', '/', 0, 0, A, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstprfs( 'U', 'N', 'N', -1, 0, A, B, 1, X, 1, R1, R2, W,
     $                IW, INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstprfs( 'U', 'N', 'N', 0, -1, A, B, 1, X, 1, R1, R2, W,
     $                IW, INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstprfs( 'U', 'N', 'N', 2, 1, A, B, 1, X, 2, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstprfs( 'U', 'N', 'N', 2, 1, A, B, 2, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cstprfs', INFOT, NOUT, LERR, OK )
*
*        cstpcon
*
         SRNAMT = 'cstpcon'
         INFOT = 1
         CALL cstpcon( '/', 'U', 'N', 0, A, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstpcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstpcon( '1', '/', 'N', 0, A, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstpcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstpcon( '1', 'U', '/', 0, A, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstpcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstpcon( '1', 'U', 'N', -1, A, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstpcon', INFOT, NOUT, LERR, OK )
*
*        cslatps
*
         SRNAMT = 'cslatps'
         INFOT = 1
         CALL cslatps( '/', 'N', 'N', 'N', 0, A, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatps', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cslatps( 'U', '/', 'N', 'N', 0, A, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatps', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cslatps( 'U', 'N', '/', 'N', 0, A, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatps', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cslatps( 'U', 'N', 'N', '/', 0, A, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatps', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cslatps( 'U', 'N', 'N', 'N', -1, A, X, SCALE, W, INFO )
         CALL CHKXER( 'cslatps', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'TB' ) ) THEN
*
*        Test error exits for the banded triangular routines.
*
*        cstbtrs
*
         SRNAMT = 'cstbtrs'
         INFOT = 1
         CALL cstbtrs( '/', 'N', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstbtrs( 'U', '/', 'N', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstbtrs( 'U', 'N', '/', 0, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstbtrs( 'U', 'N', 'N', -1, 0, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstbtrs( 'U', 'N', 'N', 0, -1, 0, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstbtrs( 'U', 'N', 'N', 0, 0, -1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstbtrs( 'U', 'N', 'N', 2, 1, 1, A, 1, X, 2, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstbtrs( 'U', 'N', 'N', 2, 0, 1, A, 1, X, 1, INFO )
         CALL CHKXER( 'cstbtrs', INFOT, NOUT, LERR, OK )
*
*        cstbrfs
*
         SRNAMT = 'cstbrfs'
         INFOT = 1
         CALL cstbrfs( '/', 'N', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstbrfs( 'U', '/', 'N', 0, 0, 0, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstbrfs( 'U', 'N', '/', 0, 0, 0, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstbrfs( 'U', 'N', 'N', -1, 0, 0, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstbrfs( 'U', 'N', 'N', 0, -1, 0, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstbrfs( 'U', 'N', 'N', 0, 0, -1, A, 1, B, 1, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstbrfs( 'U', 'N', 'N', 2, 1, 1, A, 1, B, 2, X, 2, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 1, X, 2, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cstbrfs( 'U', 'N', 'N', 2, 1, 1, A, 2, B, 2, X, 1, R1, 
     $  R2, 
     $                W, IW, INFO )
         CALL CHKXER( 'cstbrfs', INFOT, NOUT, LERR, OK )
*
*        cstbcon
*
         SRNAMT = 'cstbcon'
         INFOT = 1
         CALL cstbcon( '/', 'U', 'N', 0, 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstbcon( '1', '/', 'N', 0, 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cstbcon( '1', 'U', '/', 0, 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstbcon( '1', 'U', 'N', -1, 0, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cstbcon( '1', 'U', 'N', 0, -1, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cstbcon( '1', 'U', 'N', 2, 1, A, 1, RCOND, W, IW, INFO )
         CALL CHKXER( 'cstbcon', INFOT, NOUT, LERR, OK )
*
*        cslatbs
*
         SRNAMT = 'cslatbs'
         INFOT = 1
         CALL cslatbs( '/', 'N', 'N', 'N', 0, 0, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cslatbs( 'U', '/', 'N', 'N', 0, 0, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cslatbs( 'U', 'N', '/', 'N', 0, 0, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cslatbs( 'U', 'N', 'N', '/', 0, 0, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cslatbs( 'U', 'N', 'N', 'N', -1, 0, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cslatbs( 'U', 'N', 'N', 'N', 1, -1, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cslatbs( 'U', 'N', 'N', 'N', 2, 1, A, 1, X, SCALE, W,
     $                INFO )
         CALL CHKXER( 'cslatbs', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRTR
*
      END
