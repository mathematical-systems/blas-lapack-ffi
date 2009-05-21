      SUBROUTINE CERRPO( PATH, NUNIT )
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
*  CERRPO tests the error exits for the COMPLEX routines
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
      REAL               ANRM, RCOND
*     ..
*     .. Local Arrays ..
      REAL               R( NMAX ), R1( NMAX ), R2( NMAX )
      COMPLEX            A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, ccpbcon, ccpbequ, ccpbrfs, ccpbtf2,
     $             ccpbtrf, ccpbtrs, ccpocon, ccpoequ, ccporfs, ccpotf2,
     $             ccpotrf, ccpotri, ccpotrs, ccppcon, ccppequ, ccpprfs,
     $                   ccpptrf, ccpptri, ccpptrs
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
      INTRINSIC          CMPLX, REAL
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
            A( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
            AF( I, J ) = CMPLX( 1. / REAL( I+J ), -1. / REAL( I+J ) )
   10    CONTINUE
         B( J ) = 0.
         R1( J ) = 0.
         R2( J ) = 0.
         W( J ) = 0.
         X( J ) = 0.
   20 CONTINUE
      ANRM = 1.
      OK = .TRUE.
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite matrix.
*
      IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        ccpotrf
*
         SRNAMT = 'ccpotrf'
         INFOT = 1
         CALL ccpotrf( '/', 0, A, 1, INFO )
         CALL CHKXER( 'ccpotrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpotrf( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'ccpotrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpotrf( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'ccpotrf', INFOT, NOUT, LERR, OK )
*
*        ccpotf2
*
         SRNAMT = 'ccpotf2'
         INFOT = 1
         CALL ccpotf2( '/', 0, A, 1, INFO )
         CALL CHKXER( 'ccpotf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpotf2( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'ccpotf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpotf2( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'ccpotf2', INFOT, NOUT, LERR, OK )
*
*        ccpotri
*
         SRNAMT = 'ccpotri'
         INFOT = 1
         CALL ccpotri( '/', 0, A, 1, INFO )
         CALL CHKXER( 'ccpotri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpotri( 'U', -1, A, 1, INFO )
         CALL CHKXER( 'ccpotri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpotri( 'U', 2, A, 1, INFO )
         CALL CHKXER( 'ccpotri', INFOT, NOUT, LERR, OK )
*
*        ccpotrs
*
         SRNAMT = 'ccpotrs'
         INFOT = 1
         CALL ccpotrs( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpotrs( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpotrs( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpotrs( 'U', 2, 1, A, 1, B, 2, INFO )
         CALL CHKXER( 'ccpotrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccpotrs( 'U', 2, 1, A, 2, B, 1, INFO )
         CALL CHKXER( 'ccpotrs', INFOT, NOUT, LERR, OK )
*
*        ccporfs
*
         SRNAMT = 'ccporfs'
         INFOT = 1
         CALL ccporfs( '/', 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccporfs( 'U', -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccporfs( 'U', 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccporfs( 'U', 2, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccporfs( 'U', 2, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccporfs( 'U', 2, 1, A, 2, AF, 2, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccporfs( 'U', 2, 1, A, 2, AF, 2, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccporfs', INFOT, NOUT, LERR, OK )
*
*        ccpocon
*
         SRNAMT = 'ccpocon'
         INFOT = 1
         CALL ccpocon( '/', 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpocon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpocon( 'U', -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpocon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpocon( 'U', 2, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpocon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpocon( 'U', 1, A, 1, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpocon', INFOT, NOUT, LERR, OK )
*
*        ccpoequ
*
         SRNAMT = 'ccpoequ'
         INFOT = 1
         CALL ccpoequ( -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpoequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpoequ( 2, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpoequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        ccpptrf
*
         SRNAMT = 'ccpptrf'
         INFOT = 1
         CALL ccpptrf( '/', 0, A, INFO )
         CALL CHKXER( 'ccpptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpptrf( 'U', -1, A, INFO )
         CALL CHKXER( 'ccpptrf', INFOT, NOUT, LERR, OK )
*
*        ccpptri
*
         SRNAMT = 'ccpptri'
         INFOT = 1
         CALL ccpptri( '/', 0, A, INFO )
         CALL CHKXER( 'ccpptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpptri( 'U', -1, A, INFO )
         CALL CHKXER( 'ccpptri', INFOT, NOUT, LERR, OK )
*
*        ccpptrs
*
         SRNAMT = 'ccpptrs'
         INFOT = 1
         CALL ccpptrs( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'ccpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpptrs( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'ccpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpptrs( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'ccpptrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpptrs( 'U', 2, 1, A, B, 1, INFO )
         CALL CHKXER( 'ccpptrs', INFOT, NOUT, LERR, OK )
*
*        ccpprfs
*
         SRNAMT = 'ccpprfs'
         INFOT = 1
        CALL ccpprfs( '/', 0, 0, A, AF, B, 1, X, 1, R1, R2, W, R, INFO )
         CALL CHKXER( 'ccpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpprfs( 'U', -1, 0, A, AF, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpprfs( 'U', 0, -1, A, AF, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccpprfs( 'U', 2, 1, A, AF, B, 1, X, 2, R1, R2, W, R, INFO )
        CALL CHKXER( 'ccpprfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL ccpprfs( 'U', 2, 1, A, AF, B, 2, X, 1, R1, R2, W, R, INFO )
         CALL CHKXER( 'ccpprfs', INFOT, NOUT, LERR, OK )
*
*        ccppcon
*
         SRNAMT = 'ccppcon'
         INFOT = 1
         CALL ccppcon( '/', 0, A, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccppcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccppcon( 'U', -1, A, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccppcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccppcon( 'U', 1, A, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccppcon', INFOT, NOUT, LERR, OK )
*
*        ccppequ
*
         SRNAMT = 'ccppequ'
         INFOT = 1
         CALL ccppequ( '/', 0, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccppequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccppequ( 'U', -1, A, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccppequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the Cholesky
*     decomposition of a Hermitian positive definite band matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        ccpbtrf
*
         SRNAMT = 'ccpbtrf'
         INFOT = 1
         CALL ccpbtrf( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'ccpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbtrf( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'ccpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbtrf( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'ccpbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpbtrf( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'ccpbtrf', INFOT, NOUT, LERR, OK )
*
*        ccpbtf2
*
         SRNAMT = 'ccpbtf2'
         INFOT = 1
         CALL ccpbtf2( '/', 0, 0, A, 1, INFO )
         CALL CHKXER( 'ccpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbtf2( 'U', -1, 0, A, 1, INFO )
         CALL CHKXER( 'ccpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbtf2( 'U', 1, -1, A, 1, INFO )
         CALL CHKXER( 'ccpbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpbtf2( 'U', 2, 1, A, 1, INFO )
         CALL CHKXER( 'ccpbtf2', INFOT, NOUT, LERR, OK )
*
*        ccpbtrs
*
         SRNAMT = 'ccpbtrs'
         INFOT = 1
         CALL ccpbtrs( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbtrs( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbtrs( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccpbtrs( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpbtrs( 'U', 2, 1, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccpbtrs( 'U', 2, 0, 1, A, 1, B, 1, INFO )
         CALL CHKXER( 'ccpbtrs', INFOT, NOUT, LERR, OK )
*
*        ccpbrfs
*
         SRNAMT = 'ccpbrfs'
         INFOT = 1
         CALL ccpbrfs( '/', 0, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccpbrfs( 'U', -1, 0, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccpbrfs( 'U', 1, -1, 0, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL ccpbrfs( 'U', 0, 0, -1, A, 1, AF, 1, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpbrfs( 'U', 2, 1, 1, A, 1, AF, 2, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccpbrfs( 'U', 2, 1, 1, A, 2, AF, 1, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccpbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccpbrfs( 'U', 2, 0, 1, A, 1, AF, 1, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccpbrfs', INFOT, NOUT, LERR, OK )
*
*        ccpbcon
*
         SRNAMT = 'ccpbcon'
         INFOT = 1
         CALL ccpbcon( '/', 0, 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbcon( 'U', -1, 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbcon( 'U', 1, -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpbcon( 'U', 2, 1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpbcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccpbcon( 'U', 1, 0, A, 1, -ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccpbcon', INFOT, NOUT, LERR, OK )
*
*        ccpbequ
*
         SRNAMT = 'ccpbequ'
         INFOT = 1
         CALL ccpbequ( '/', 0, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccpbequ( 'U', -1, 0, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccpbequ( 'U', 1, -1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpbequ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccpbequ( 'U', 2, 1, A, 1, R1, RCOND, ANRM, INFO )
         CALL CHKXER( 'ccpbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRPO
*
      END
