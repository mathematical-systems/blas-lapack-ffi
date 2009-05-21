      SUBROUTINE ZERRPO( PATH, NUNIT )
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
*  ZERRPO tests the error exits for the COMPLEX*16 routines
*  for Hermitian positive definite matrices.
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
      DOUBLE PRECISION   ANRM, RCOND
*     ..
*     .. Local Arrays ..
      DOUBLE PRECISION   R( NMAX ), R1( NMAX ), R2( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, czpbcon, czpbequ, czpbrfs, czpbtf2,
     $             czpbtrf, czpbtrs, czpocon, czpoequ, czporfs, czpotf2,
     $             czpotrf, czpotri, czpotrs, czppcon, czppequ, czpprfs,
     $                   czpptrf, czpptri, czpptrs
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
      C2 = PATH( 2: 3 )
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
         R1( J ) = 0.D0
         R2( J ) = 0.D0
         W( J ) = 0.D0
         X( J ) = 0.D0
   20 CONTINUE
      ANRM = 1.D0
      OK = .TRUE.
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite matrix.
*
      IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        czpotrf
*
         SRNAMT = 'czpotrf'
         INFOT = 1
         CALL czpotrf( '/', 0, A, 1, INFO )
         CALL CHKXER( 'czpotrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpotrf( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'czpotrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpotrf( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'czpotrf', INFOT, NOUT, LERR, OK )
*
*        czpotf2
*
         SRNAMT = 'czpotf2'
         INFOT = 1
         CALL czpotf2( '/', 0, A, 1, INFO )
         CALL CHKXER( 'czpotf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpotf2( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'czpotf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpotf2( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'czpotf2', INFOT, NOUT, LERR, OK )
*
*        czpotri
*
         SRNAMT = 'czpotri'
         INFOT = 1
         CALL czpotri( '/', 0, A, 1, INFO )
         CALL CHKXER( 'czpotri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpotri( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'czpotri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpotri( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'czpotri', INFOT, NOUT, LERR, OK )
*
*        czpotrs
*
         SRNAMT = 'czpotrs'
         INFOT = 1
         CALL czpotrs( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpotrs( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpotrs( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpotrs( 'U', 2, 1, A, 1, B, 2, INFO )
         CALL CHKXER( 'czpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czpotrs( 'U', 2, 1, A, 2, B, 1, INFO )
         CALL CHKXER( 'czpotrs', INFOT, NOUT, LERR, OK )
*
*        czporfs
*
         SRNAMT = 'czporfs'
         INFOT = 1
         CALL czporfs( '/', 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czporfs( 'U', -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czporfs( 'U', 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czporfs( 'U', 2, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czporfs( 'U', 2, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czporfs( 'U', 2, 1, A, 2, AF, 2, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czporfs( 'U', 2, 1, A, 2, AF, 2, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czporfs', INFOT, NOUT, LERR, OK )
*
*        czpocon
*
         SRNAMT = 'czpocon'
         INFOT = 1
         CALL czpocon( '/', 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpocon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpocon( 'U', -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpocon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpocon( 'U', 2, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpocon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpocon( 'U', 1, A, 1, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpocon', INFOT, NOUT, LERR, OK )
*
*        czpoequ
*
         SRNAMT = 'czpoequ'
         INFOT = 1
         CALL czpoequ( -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpoequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpoequ( 2, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpoequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        czpptrf
*
         SRNAMT = 'czpptrf'
         INFOT = 1
         CALL czpptrf( '/', 0, A, INFO )
         CALL CHKXER( 'czpptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpptrf( 'U', -1, A, INFO )
         CALL CHKXER( 'czpptrf', INFOT, NOUT, LERR, OK )
*
*        czpptri
*
         SRNAMT = 'czpptri'
         INFOT = 1
         CALL czpptri( '/', 0, A, INFO )
         CALL CHKXER( 'czpptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpptri( 'U', -1, A, INFO )
         CALL CHKXER( 'czpptri', INFOT, NOUT, LERR, OK )
*
*        czpptrs
*
         SRNAMT = 'czpptrs'
         INFOT = 1
         CALL czpptrs( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'czpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpptrs( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'czpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpptrs( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'czpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpptrs( 'U', 2, 1, A, B, 1, INFO )
         CALL CHKXER( 'czpptrs', INFOT, NOUT, LERR, OK )
*
*        czpprfs
*
         SRNAMT = 'czpprfs'
         INFOT = 1
        CALL czpprfs( '/', 0, 0, A, AF, B, 1, X, 1, R1, R2, W, R, INFO )
         CALL CHKXER( 'czpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpprfs( 'U', -1, 0, A, AF, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpprfs( 'U', 0, -1, A, AF, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czpprfs( 'U', 2, 1, A, AF, B, 1, X, 2, R1, R2, W, R, INFO )
         CALL CHKXER( 'czpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL czpprfs( 'U', 2, 1, A, AF, B, 2, X, 1, R1, R2, W, R, INFO )
         CALL CHKXER( 'czpprfs', INFOT, NOUT, LERR, OK )
*
*        czppcon
*
         SRNAMT = 'czppcon'
         INFOT = 1
         CALL czppcon( '/', 0, A, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czppcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czppcon( 'U', -1, A, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czppcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czppcon( 'U', 1, A, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czppcon', INFOT, NOUT, LERR, OK )
*
*        czppequ
*
         SRNAMT = 'czppequ'
         INFOT = 1
         CALL czppequ( '/', 0, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czppequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czppequ( 'U', -1, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czppequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite band matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        czpbtrf
*
         SRNAMT = 'czpbtrf'
         INFOT = 1
         CALL czpbtrf( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'czpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbtrf( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'czpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbtrf( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'czpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpbtrf( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'czpbtrf', INFOT, NOUT, LERR, OK )
*
*        czpbtf2
*
         SRNAMT = 'czpbtf2'
         INFOT = 1
         CALL czpbtf2( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'czpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbtf2( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'czpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbtf2( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'czpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpbtf2( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'czpbtf2', INFOT, NOUT, LERR, OK )
*
*        czpbtrs
*
         SRNAMT = 'czpbtrs'
         INFOT = 1
         CALL czpbtrs( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbtrs( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbtrs( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpbtrs( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpbtrs( 'U', 2, 1, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czpbtrs( 'U', 2, 0, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbtrs', INFOT, NOUT, LERR, OK )
*
*        czpbrfs
*
         SRNAMT = 'czpbrfs'
         INFOT = 1
         CALL czpbrfs( '/', 0, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czpbrfs( 'U', -1, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czpbrfs( 'U', 1, -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL czpbrfs( 'U', 0, 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpbrfs( 'U', 2, 1, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czpbrfs( 'U', 2, 1, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czpbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czpbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czpbrfs', INFOT, NOUT, LERR, OK )
*
*        czpbcon
*
         SRNAMT = 'czpbcon'
         INFOT = 1
         CALL czpbcon( '/', 0, 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbcon( 'U', -1, 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbcon( 'U', 1, -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpbcon( 'U', 2, 1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpbcon( 'U', 1, 0, A, 1, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czpbcon', INFOT, NOUT, LERR, OK )
*
*        czpbequ
*
         SRNAMT = 'czpbequ'
         INFOT = 1
         CALL czpbequ( '/', 0, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbequ( 'U', -1, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbequ( 'U', 1, -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpbequ( 'U', 2, 1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'czpbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRPO
*
      END
