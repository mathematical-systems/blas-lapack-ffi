      SUBROUTINE SERRGE( PATH, NUNIT )
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
*  SERRGE tests the error exits for the REAL routines
*  for general matrices.
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
      INTEGER            NMAX, LW
      PARAMETER          ( NMAX = 4, LW = 3*NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J
      REAL               ANRM, CCOND, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX ), IW( NMAX )
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   R1( NMAX ), R2( NMAX ), W( LW ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgbcon, csgbequ, csgbrfs, 
     $  csgbtf2, 
     $                   csgbtrf, csgbtrs, csgecon, csgeequ, csgerfs, 
     $  csgetf2, 
     $                   csgetrf, csgetri, csgetrs
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
         IP( J ) = J
         IW( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        Test error exits of the routines that use the LU decomposition
*        of a general matrix.
*
*        csgetrf
*
         SRNAMT = 'csgetrf'
         INFOT = 1
         CALL csgetrf( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgetrf( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'csgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgetrf( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'csgetrf', INFOT, NOUT, LERR, OK )
*
*        csgetf2
*
         SRNAMT = 'csgetf2'
         INFOT = 1
         CALL csgetf2( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgetf2( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'csgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgetf2( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'csgetf2', INFOT, NOUT, LERR, OK )
*
*        csgetri
*
         SRNAMT = 'csgetri'
         INFOT = 1
         CALL csgetri( -1, A, 1, IP, W, LW, INFO )
         CALL CHKXER( 'csgetri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgetri( 2, A, 1, IP, W, LW, INFO )
         CALL CHKXER( 'csgetri', INFOT, NOUT, LERR, OK )
*
*        csgetrs
*
         SRNAMT = 'csgetrs'
         INFOT = 1
         CALL csgetrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgetrs( 'N', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgetrs( 'N', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgetrs( 'N', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'csgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgetrs( 'N', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'csgetrs', INFOT, NOUT, LERR, OK )
*
*        csgerfs
*
         SRNAMT = 'csgerfs'
         INFOT = 1
         CALL csgerfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgerfs( 'N', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgerfs( 'N', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgerfs( 'N', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgerfs( 'N', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'csgerfs', INFOT, NOUT, LERR, OK )
*
*        csgecon
*
         SRNAMT = 'csgecon'
         INFOT = 1
         CALL csgecon( '/', 0, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csgecon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgecon( '1', -1, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csgecon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgecon( '1', 2, A, 1, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csgecon', INFOT, NOUT, LERR, OK )
*
*        csgeequ
*
         SRNAMT = 'csgeequ'
         INFOT = 1
         CALL csgeequ( -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'csgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgeequ( 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'csgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgeequ( 2, 2, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'csgeequ', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        Test error exits of the routines that use the LU decomposition
*        of a general band matrix.
*
*        csgbtrf
*
         SRNAMT = 'csgbtrf'
         INFOT = 1
         CALL csgbtrf( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbtrf( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbtrf( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbtrf( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbtrf( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'csgbtrf', INFOT, NOUT, LERR, OK )
*
*        csgbtf2
*
         SRNAMT = 'csgbtf2'
         INFOT = 1
         CALL csgbtf2( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbtf2( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbtf2( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbtf2( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'csgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbtf2( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'csgbtf2', INFOT, NOUT, LERR, OK )
*
*        csgbtrs
*
         SRNAMT = 'csgbtrs'
         INFOT = 1
         CALL csgbtrs( '/', 0, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbtrs( 'N', -1, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbtrs( 'N', 1, -1, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbtrs( 'N', 1, 0, -1, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgbtrs( 'N', 1, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgbtrs( 'N', 2, 1, 1, 1, A, 3, IP, B, 2, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgbtrs( 'N', 2, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbtrs', INFOT, NOUT, LERR, OK )
*
*        csgbrfs
*
         SRNAMT = 'csgbrfs'
         INFOT = 1
         CALL csgbrfs( '/', 0, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbrfs( 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbrfs( 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbrfs( 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgbrfs( 'N', 1, 0, 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgbrfs( 'N', 2, 1, 1, 1, A, 2, AF, 4, IP, B, 2, X, 2, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csgbrfs( 'N', 2, 1, 1, 1, A, 3, AF, 3, IP, B, 2, X, 2, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 1, X, 2, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 2, X, 1, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csgbrfs', INFOT, NOUT, LERR, OK )
*
*        csgbcon
*
         SRNAMT = 'csgbcon'
         INFOT = 1
         CALL csgbcon( '/', 0, 0, 0, A, 1, IP, ANRM, RCOND, W, IW, INFO 
     $  ) 
         CALL CHKXER( 'csgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbcon( '1', -1, 0, 0, A, 1, IP, ANRM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbcon( '1', 1, -1, 0, A, 1, IP, ANRM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbcon( '1', 1, 0, -1, A, 1, IP, ANRM, RCOND, W, IW,
     $                INFO )
         CALL CHKXER( 'csgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbcon( '1', 2, 1, 1, A, 3, IP, ANRM, RCOND, W, IW, INFO 
     $  ) 
         CALL CHKXER( 'csgbcon', INFOT, NOUT, LERR, OK )
*
*        csgbequ
*
         SRNAMT = 'csgbequ'
         INFOT = 1
         CALL csgbequ( -1, 0, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'csgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbequ( 0, -1, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'csgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbequ( 1, 1, -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'csgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbequ( 1, 1, 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'csgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbequ( 2, 2, 1, 1, A, 2, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'csgbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRGE
*
      END
