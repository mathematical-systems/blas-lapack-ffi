      SUBROUTINE SERRPO( PATH, NUNIT )
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
*  SERRPO tests the error exits for the REAL routines
*  for symmetric positive definite matrices.
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
      PARAMETER          ( NMAX = 4 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J
      REAL               ANRM, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IW( NMAX )
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   R1( NMAX ), R2( NMAX ), W( 3*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, cspbcon, cspbequ, cspbrfs, 
     $  cspbtf2, 
     $                   cspbtrf, cspbtrs, cspocon, cspoequ, csporfs, 
     $  cspotf2, 
     $                   cspotrf, cspotri, cspotrs, csppcon, csppequ, 
     $  cspprfs, 
     $                   cspptrf, cspptri, cspptrs
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
      C2 = PATH( 2: 3 )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = 1. / REAL( I+J )
            AF( I, J ) = 1. / REAL( I+J )
   10    CONTINUE
         B( J ) = 0.
         R1( J ) = 0.
         R2( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
         IW( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite matrix.
*
*        cspotrf
*
         SRNAMT = 'cspotrf'
         INFOT = 1
         CALL cspotrf( '/', 0, A, 1, INFO )
         CALL CHKXER( 'cspotrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspotrf( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'cspotrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspotrf( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'cspotrf', INFOT, NOUT, LERR, OK )
*
*        cspotf2
*
         SRNAMT = 'cspotf2'
         INFOT = 1
         CALL cspotf2( '/', 0, A, 1, INFO )
         CALL CHKXER( 'cspotf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspotf2( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'cspotf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspotf2( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'cspotf2', INFOT, NOUT, LERR, OK )
*
*        cspotri
*
         SRNAMT = 'cspotri'
         INFOT = 1
         CALL cspotri( '/', 0, A, 1, INFO )
         CALL CHKXER( 'cspotri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspotri( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'cspotri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspotri( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'cspotri', INFOT, NOUT, LERR, OK )
*
*        cspotrs
*
         SRNAMT = 'cspotrs'
         INFOT = 1
         CALL cspotrs( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspotrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspotrs( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspotrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspotrs( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspotrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspotrs( 'U', 2, 1, A, 1, B, 2, INFO )
         CALL CHKXER( 'cspotrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cspotrs( 'U', 2, 1, A, 2, B, 1, INFO )
         CALL CHKXER( 'cspotrs', INFOT, NOUT, LERR, OK )
*
*        csporfs
*
         SRNAMT = 'csporfs'
         INFOT = 1
         CALL csporfs( '/', 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csporfs( 'U', -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                IW, INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csporfs( 'U', 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                IW, INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csporfs( 'U', 2, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csporfs( 'U', 2, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csporfs( 'U', 2, 1, A, 2, AF, 2, B, 1, X, 2, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csporfs( 'U', 2, 1, A, 2, AF, 2, B, 2, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'csporfs', INFOT, NOUT, LERR, OK )
*
*        cspocon
*
         SRNAMT = 'cspocon'
         INFOT = 1
         CALL cspocon( '/', 0, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspocon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspocon( 'U', -1, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspocon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspocon( 'U', 2, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspocon', INFOT, NOUT, LERR, OK )
*
*        cspoequ
*
         SRNAMT = 'cspoequ'
         INFOT = 1
         CALL cspoequ( -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspoequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspoequ( 2, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspoequ', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite packed matrix.
*
*        cspptrf
*
         SRNAMT = 'cspptrf'
         INFOT = 1
         CALL cspptrf( '/', 0, A, INFO )
         CALL CHKXER( 'cspptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspptrf( 'U', -1, A, INFO )
         CALL CHKXER( 'cspptrf', INFOT, NOUT, LERR, OK )
*
*        cspptri
*
         SRNAMT = 'cspptri'
         INFOT = 1
         CALL cspptri( '/', 0, A, INFO )
         CALL CHKXER( 'cspptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspptri( 'U', -1, A, INFO )
         CALL CHKXER( 'cspptri', INFOT, NOUT, LERR, OK )
*
*        cspptrs
*
         SRNAMT = 'cspptrs'
         INFOT = 1
         CALL cspptrs( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'cspptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspptrs( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'cspptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspptrs( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'cspptrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspptrs( 'U', 2, 1, A, B, 1, INFO )
         CALL CHKXER( 'cspptrs', INFOT, NOUT, LERR, OK )
*
*        cspprfs
*
         SRNAMT = 'cspprfs'
         INFOT = 1
         CALL cspprfs( '/', 0, 0, A, AF, B, 1, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cspprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspprfs( 'U', -1, 0, A, AF, B, 1, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cspprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspprfs( 'U', 0, -1, A, AF, B, 1, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cspprfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cspprfs( 'U', 2, 1, A, AF, B, 1, X, 2, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cspprfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cspprfs( 'U', 2, 1, A, AF, B, 2, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cspprfs', INFOT, NOUT, LERR, OK )
*
*        csppcon
*
         SRNAMT = 'csppcon'
         INFOT = 1
         CALL csppcon( '/', 0, A, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csppcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csppcon( 'U', -1, A, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csppcon', INFOT, NOUT, LERR, OK )
*
*        csppequ
*
         SRNAMT = 'csppequ'
         INFOT = 1
         CALL csppequ( '/', 0, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'csppequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csppequ( 'U', -1, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'csppequ', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite band matrix.
*
*        cspbtrf
*
         SRNAMT = 'cspbtrf'
         INFOT = 1
         CALL cspbtrf( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'cspbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbtrf( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'cspbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbtrf( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'cspbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspbtrf( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'cspbtrf', INFOT, NOUT, LERR, OK )
*
*        cspbtf2
*
         SRNAMT = 'cspbtf2'
         INFOT = 1
         CALL cspbtf2( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'cspbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbtf2( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'cspbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbtf2( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'cspbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspbtf2( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'cspbtf2', INFOT, NOUT, LERR, OK )
*
*        cspbtrs
*
         SRNAMT = 'cspbtrs'
         INFOT = 1
         CALL cspbtrs( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbtrs( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbtrs( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspbtrs( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspbtrs( 'U', 2, 1, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cspbtrs( 'U', 2, 0, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbtrs', INFOT, NOUT, LERR, OK )
*
*        cspbrfs
*
         SRNAMT = 'cspbrfs'
         INFOT = 1
         CALL cspbrfs( '/', 0, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbrfs( 'U', -1, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbrfs( 'U', 1, -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspbrfs( 'U', 0, 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspbrfs( 'U', 2, 1, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cspbrfs( 'U', 2, 1, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cspbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 1, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cspbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 2, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cspbrfs', INFOT, NOUT, LERR, OK )
*
*        cspbcon
*
         SRNAMT = 'cspbcon'
         INFOT = 1
         CALL cspbcon( '/', 0, 0, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbcon( 'U', -1, 0, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbcon( 'U', 1, -1, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspbcon( 'U', 2, 1, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cspbcon', INFOT, NOUT, LERR, OK )
*
*        cspbequ
*
         SRNAMT = 'cspbequ'
         INFOT = 1
         CALL cspbequ( '/', 0, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbequ( 'U', -1, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbequ( 'U', 1, -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspbequ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspbequ( 'U', 2, 1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'cspbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRPO
*
      END
