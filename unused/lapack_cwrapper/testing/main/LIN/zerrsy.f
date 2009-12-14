      SUBROUTINE ZERRSY( PATH, NUNIT )
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
*  ZERRSY tests the error exits for the COMPLEX*16 routines
*  for symmetric indefinite matrices.
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
      EXTERNAL       ALAESM, CHKXER, czspcon, czsprFS, czsptrf, czsptri,
     $             czsptrs, czsycon, czsyrFS, czsytf2, czsytrf, czsytri,
     $                   czsytrs
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
      ANRM = 1.0D0
      OK = .TRUE.
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a symmetric indefinite matrix.
*
      IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        czsytrf
*
         SRNAMT = 'czsytrf'
         INFOT = 1
         CALL czsytrf( '/', 0, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'czsytrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsytrf( 'U', -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'czsytrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czsytrf( 'U', 2, A, 1, IP, W, 4, INFO )
         CALL CHKXER( 'czsytrf', INFOT, NOUT, LERR, OK )
*
*        czsytf2
*
         SRNAMT = 'czsytf2'
         INFOT = 1
         CALL czsytf2( '/', 0, A, 1, IP, INFO )
         CALL CHKXER( 'czsytf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsytf2( 'U', -1, A, 1, IP, INFO )
         CALL CHKXER( 'czsytf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czsytf2( 'U', 2, A, 1, IP, INFO )
         CALL CHKXER( 'czsytf2', INFOT, NOUT, LERR, OK )
*
*        czsytri
*
         SRNAMT = 'czsytri'
         INFOT = 1
         CALL czsytri( '/', 0, A, 1, IP, W, INFO )
         CALL CHKXER( 'czsytri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsytri( 'U', -1, A, 1, IP, W, INFO )
         CALL CHKXER( 'czsytri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czsytri( 'U', 2, A, 1, IP, W, INFO )
         CALL CHKXER( 'czsytri', INFOT, NOUT, LERR, OK )
*
*        czsytrs
*
         SRNAMT = 'czsytrs'
         INFOT = 1
         CALL czsytrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsytrs( 'U', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsytrs( 'U', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czsytrs( 'U', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'czsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czsytrs( 'U', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'czsytrs', INFOT, NOUT, LERR, OK )
*
*        czsyrFS
*
         SRNAMT = 'czsyrFS'
         INFOT = 1
        CALL czsyrFS( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsyrFS( 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsyrFS( 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czsyrFS( 'U', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czsyrFS( 'U', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL czsyrFS( 'U', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czsyrFS( 'U', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czsyrFS', INFOT, NOUT, LERR, OK )
*
*        czsycon
*
         SRNAMT = 'czsycon'
         INFOT = 1
         CALL czsycon( '/', 0, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czsycon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsycon( 'U', -1, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czsycon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czsycon( 'U', 2, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czsycon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czsycon( 'U', 1, A, 1, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czsycon', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a symmetric indefinite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        czsptrf
*
         SRNAMT = 'czsptrf'
         INFOT = 1
         CALL czsptrf( '/', 0, A, IP, INFO )
         CALL CHKXER( 'czsptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsptrf( 'U', -1, A, IP, INFO )
         CALL CHKXER( 'czsptrf', INFOT, NOUT, LERR, OK )
*
*        czsptri
*
         SRNAMT = 'czsptri'
         INFOT = 1
         CALL czsptri( '/', 0, A, IP, W, INFO )
         CALL CHKXER( 'czsptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsptri( 'U', -1, A, IP, W, INFO )
         CALL CHKXER( 'czsptri', INFOT, NOUT, LERR, OK )
*
*        czsptrs
*
         SRNAMT = 'czsptrs'
         INFOT = 1
         CALL czsptrs( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsptrs( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsptrs( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czsptrs( 'U', 2, 1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czsptrs', INFOT, NOUT, LERR, OK )
*
*        czsprFS
*
         SRNAMT = 'czsprFS'
         INFOT = 1
         CALL czsprFS( '/', 0, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsprFS( 'U', -1, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsprFS( 'U', 0, -1, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czsprFS( 'U', 2, 1, A, AF, IP, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czsprFS( 'U', 2, 1, A, AF, IP, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czsprFS', INFOT, NOUT, LERR, OK )
*
*        czspcon
*
         SRNAMT = 'czspcon'
         INFOT = 1
         CALL czspcon( '/', 0, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czspcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czspcon( 'U', -1, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czspcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czspcon( 'U', 1, A, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czspcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRSY
*
      END
