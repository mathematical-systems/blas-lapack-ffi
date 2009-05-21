      SUBROUTINE ZERRGE( PATH, NUNIT )
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
*  ZERRGE tests the error exits for the COMPLEX*16 routines
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
      DOUBLE PRECISION   ANRM, CCOND, RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      DOUBLE PRECISION   R( NMAX ), R1( NMAX ), R2( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL       ALAESM, CHKXER, czgbcon, czgbequ, czgbrfs, czgbtf2,
     $             czgbtrf, czgbtrs, czgecon, czgeequ, czgerfs, czgetf2,
     $                   czgetrf, czgetri, czgetrs
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
         IP( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
*     Test error exits of the routines that use the LU decomposition
*     of a general matrix.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        czgetrf
*
         SRNAMT = 'czgetrf'
         INFOT = 1
         CALL czgetrf( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgetrf( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'czgetrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgetrf( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'czgetrf', INFOT, NOUT, LERR, OK )
*
*        czgetf2
*
         SRNAMT = 'czgetf2'
         INFOT = 1
         CALL czgetf2( -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgetf2( 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'czgetf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgetf2( 2, 1, A, 1, IP, INFO )
         CALL CHKXER( 'czgetf2', INFOT, NOUT, LERR, OK )
*
*        czgetri
*
         SRNAMT = 'czgetri'
         INFOT = 1
         CALL czgetri( -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'czgetri', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgetri( 2, A, 1, IP, W, 2, INFO )
         CALL CHKXER( 'czgetri', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgetri( 2, A, 2, IP, W, 1, INFO )
         CALL CHKXER( 'czgetri', INFOT, NOUT, LERR, OK )
*
*        czgetrs
*
         SRNAMT = 'czgetrs'
         INFOT = 1
         CALL czgetrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgetrs( 'N', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgetrs( 'N', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgetrs( 'N', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'czgetrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgetrs( 'N', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'czgetrs', INFOT, NOUT, LERR, OK )
*
*        czgerfs
*
         SRNAMT = 'czgerfs'
         INFOT = 1
        CALL czgerfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgerfs( 'N', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgerfs( 'N', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czgerfs( 'N', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czgerfs( 'N', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL czgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czgerfs( 'N', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czgerfs', INFOT, NOUT, LERR, OK )
*
*        czgecon
*
         SRNAMT = 'czgecon'
         INFOT = 1
         CALL czgecon( '/', 0, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgecon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgecon( '1', -1, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgecon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgecon( '1', 2, A, 1, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgecon', INFOT, NOUT, LERR, OK )
*
*        czgeequ
*
         SRNAMT = 'czgeequ'
         INFOT = 1
         CALL czgeequ( -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'czgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgeequ( 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'czgeequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgeequ( 2, 2, A, 1, R1, R2, RCOND, CCOND, ANRM, INFO )
         CALL CHKXER( 'czgeequ', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the LU decomposition
*     of a general band matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        czgbtrf
*
         SRNAMT = 'czgbtrf'
         INFOT = 1
         CALL czgbtrf( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbtrf( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbtrf( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbtrf( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtrf', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbtrf( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'czgbtrf', INFOT, NOUT, LERR, OK )
*
*        czgbtf2
*
         SRNAMT = 'czgbtf2'
         INFOT = 1
         CALL czgbtf2( -1, 0, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbtf2( 0, -1, 0, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbtf2( 1, 1, -1, 0, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbtf2( 1, 1, 0, -1, A, 1, IP, INFO )
         CALL CHKXER( 'czgbtf2', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbtf2( 2, 2, 1, 1, A, 3, IP, INFO )
         CALL CHKXER( 'czgbtf2', INFOT, NOUT, LERR, OK )
*
*        czgbtrs
*
         SRNAMT = 'czgbtrs'
         INFOT = 1
         CALL czgbtrs( '/', 0, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbtrs( 'N', -1, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbtrs( 'N', 1, -1, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbtrs( 'N', 1, 0, -1, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgbtrs( 'N', 1, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgbtrs( 'N', 2, 1, 1, 1, A, 3, IP, B, 2, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgbtrs( 'N', 2, 0, 0, 1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbtrs', INFOT, NOUT, LERR, OK )
*
*        czgbrfs
*
         SRNAMT = 'czgbrfs'
         INFOT = 1
         CALL czgbrfs( '/', 0, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czgbrfs( 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czgbrfs( 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL czgbrfs( 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czgbrfs( 'N', 1, 0, 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgbrfs( 'N', 2, 1, 1, 1, A, 2, AF, 4, IP, B, 2, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czgbrfs( 'N', 2, 1, 1, 1, A, 3, AF, 3, IP, B, 2, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 1, X, 2, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czgbrfs( 'N', 2, 0, 0, 1, A, 1, AF, 1, IP, B, 2, X, 1, R1,
     $                R2, W, R, INFO )
         CALL CHKXER( 'czgbrfs', INFOT, NOUT, LERR, OK )
*
*        czgbcon
*
         SRNAMT = 'czgbcon'
         INFOT = 1
         CALL czgbcon( '/', 0, 0, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czgbcon( '1', -1, 0, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czgbcon( '1', 1, -1, 0, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL czgbcon( '1', 1, 0, -1, A, 1, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgbcon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbcon( '1', 2, 1, 1, A, 3, IP, ANRM, RCOND, W, R, INFO )
         CALL CHKXER( 'czgbcon', INFOT, NOUT, LERR, OK )
*
*        czgbequ
*
         SRNAMT = 'czgbequ'
         INFOT = 1
         CALL czgbequ( -1, 0, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'czgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbequ( 0, -1, 0, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'czgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbequ( 1, 1, -1, 0, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'czgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbequ( 1, 1, 0, -1, A, 1, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'czgbequ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbequ( 2, 2, 1, 1, A, 2, R1, R2, RCOND, CCOND, ANRM,
     $                INFO )
         CALL CHKXER( 'czgbequ', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRGE
*
      END
