      SUBROUTINE CERRGE( PATH, NUNIT )
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
*  CERRGE tests the error exits for the COMPLEX routines
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
      INTEGER            NMAX
      PARAMETER          ( NMAX = 4 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, INFO, J
      REAL               ANRM, CCOND, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      REAL               R( NMAX ), R1( NMAX ), R2( NMAX )
      COMPLEX            A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      ALAESM, ccgbcon, ccgbequ, ccgbrfs, ccgbtf2, ccgbtrf,
     $             ccgbtrs, ccgecon, ccgeequ, ccgerfs, ccgetf2, ccgetrf,
     $                   ccgetri, ccgetrs, CHKXER
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
         IP( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
*     Test error exits of the routines that use the LU decomposition
*     of a general matrix.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        ccgetrf
*
         SRNAMT = 'ccgetrf'
         INFOT = 1
         CALL ccgetrf( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgetrf( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgetrf( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetrf', INFOT, NOUT, LERR, OK )
*
*        ccgetf2
*
         SRNAMT = 'ccgetf2'
         INFOT = 1
         CALL ccgetf2( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgetf2( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgetf2( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgetf2', INFOT, NOUT, LERR, OK )
*
*        ccgetri
*
         SRNAMT = 'ccgetri'
         INFOT = 1
         CALL ccgetri( -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'ccgetri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgetri( 2, A, 1, IP, W, 2, INFO )
         CALL CHKXER( 'ccgetri', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgetri( 2, A, 2, IP, W, 1, INFO )
         CALL CHKXER( 'ccgetri', INFOT, NOUT, LERR, OK )
*
*        ccgetrs
*
         SRNAMT = 'ccgetrs'
         INFOT = 1
         CALL ccgetrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgetrs( 'N', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgetrs( 'N', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgetrs( 'N', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'ccgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgetrs( 'N', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'ccgetrs', INFOT, NOUT, LERR, OK )
*
*        ccgerfs
*
         SRNAMT = 'ccgerfs'
         INFOT = 1
        CALL ccgerfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgerfs( 'N', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgerfs( 'N', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL ccgerfs( 'N', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccgerfs( 'N', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL ccgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL ccgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccgerfs', INFOT, NOUT, LERR, OK )
*
*        ccgecon
*
         SRNAMT = 'ccgecon'
         INFOT = 1
         CALL ccgecon( '/', 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgecon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgecon( '1', -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgecon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgecon( '1', 2, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgecon', INFOT, NOUT, LERR, OK )
*
*        ccgeequ
*
         SRNAMT = 'ccgeequ'
         INFOT = 1
         CALL ccgeequ( -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'ccgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeequ( 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'ccgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgeequ( 2, 2, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'ccgeequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the LU decomposition
*     of a general band matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        ccgbtrf
*
         SRNAMT = 'ccgbtrf'
         INFOT = 1
         CALL ccgbtrf( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbtrf( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbtrf( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbtrf( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbtrf( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'ccgbtrf', INFOT, NOUT, LERR, OK )
*
*        ccgbtf2
*
         SRNAMT = 'ccgbtf2'
         INFOT = 1
         CALL ccgbtf2( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbtf2( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbtf2( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbtf2( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'ccgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbtf2( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'ccgbtf2', INFOT, NOUT, LERR, OK )
*
*        ccgbtrs
*
         SRNAMT = 'ccgbtrs'
         INFOT = 1
         CALL ccgbtrs( '/', 0, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbtrs( 'N', -1, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbtrs( 'N', 1, -1, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbtrs( 'N', 1, 0, -1, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgbtrs( 'N', 1, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgbtrs( 'N', 2, 1, 1, 1, A, 3, IP, B, 2, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccgbtrs( 'N', 2, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccgbtrs', INFOT, NOUT, LERR, OK )
*
*        ccgbrfs
*
         SRNAMT = 'ccgbrfs'
         INFOT = 1
         CALL ccgbrfs( '/', 0, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccgbrfs( 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccgbrfs( 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL ccgbrfs( 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
        INFOT = 5
        CALL ccgbrfs( 'N', 1, 0, 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgbrfs( 'N', 2, 1, 1, 1, A, 2, AF, 4, IP, B, 2, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccgbrfs( 'N', 2, 1, 1, 1, A, 3, AF, 3, IP, B, 2, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL ccgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 1, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL ccgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 2, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'ccgbrfs', INFOT, NOUT, LERR, OK )
*
*        ccgbcon
*
         SRNAMT = 'ccgbcon'
         INFOT = 1
         CALL ccgbcon( '/', 0, 0, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL ccgbcon( '1', -1, 0, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL ccgbcon( '1', 1, -1, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL ccgbcon( '1', 1, 0, -1, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbcon( '1', 2, 1, 1, A, 3, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'ccgbcon', INFOT, NOUT, LERR, OK )
*
*        ccgbequ
*
         SRNAMT = 'ccgbequ'
         INFOT = 1
         CALL ccgbequ( -1, 0, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'ccgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgbequ( 0, -1, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'ccgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgbequ( 1, 1, -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'ccgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgbequ( 1, 1, 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'ccgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccgbequ( 2, 2, 1, 1, A, 2, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'ccgbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRGE
*
      END
