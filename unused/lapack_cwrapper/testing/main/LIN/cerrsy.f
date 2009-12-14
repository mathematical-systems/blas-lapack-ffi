      SUBROUTINE CERRSY( PATH, NUNIT )
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
*  CERRSY tests the error exits for the COMPLEX routines
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
      REAL               ANRM, RCOND
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
      EXTERNAL       ALAESM, CHKXER, ccspcon, ccsprFS, ccsptrf, ccsptri,
     $             ccsptrs, ccsycon, ccsyrFS, ccsytf2, ccsytrf, ccsytri,
     $                   ccsytrs
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
      ANRM = 1.0
      OK = .TRUE.
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a symmetric indefinite matrix.
*
      IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        ccsytrf
*
         SRNAMT = 'ccsytrf'
         INFOT = 1
         CALL ccsytrf( '/', 0, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'ccsytrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsytrf( 'U', -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'ccsytrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccsytrf( 'U', 2, A, 1, IP, W, 4, INFO )
         CALL CHKXER( 'ccsytrf', INFOT, NOUT, LERR, OK )
*
*        ccsytf2
*
         SRNAMT = 'ccsytf2'
         INFOT = 1
         CALL ccsytf2( '/', 0, A, 1, IP, INFO )
         CALL CHKXER( 'ccsytf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsytf2( 'U', -1, A, 1, IP, INFO )
         CALL CHKXER( 'ccsytf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccsytf2( 'U', 2, A, 1, IP, INFO )
         CALL CHKXER( 'ccsytf2', INFOT, NOUT, LERR, OK )
*
*        ccsytri
*
         SRNAMT = 'ccsytri'
         INFOT = 1
         CALL ccsytri( '/', 0, A, 1, IP, W, INFO )
         CALL CHKXER( 'ccsytri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsytri( 'U', -1, A, 1, IP, W, INFO )
         CALL CHKXER( 'ccsytri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccsytri( 'U', 2, A, 1, IP, W, INFO )
         CALL CHKXER( 'ccsytri', INFOT, NOUT, LERR, OK )
*
*        ccsytrs
*
         SRNAMT = 'ccsytrs'
         INFOT = 1
         CALL ccsytrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsytrs( 'U', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsytrs( 'U', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'ccsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccsytrs( 'U', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'ccsytrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccsytrs( 'U', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'ccsytrs', INFOT, NOUT, LERR, OK )
*
*        ccsyrFS
*
         SRNAMT = 'ccsyrFS'
         INFOT = 1
        CALL ccsyrFS( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsyrFS( 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsyrFS( 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL ccsyrFS( 'U', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccsyrFS( 'U', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL ccsyrFS( 'U', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL ccsyrFS( 'U', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccsyrFS', INFOT, NOUT, LERR, OK )
*
*        ccsycon
*
         SRNAMT = 'ccsycon'
         INFOT = 1
         CALL ccsycon( '/', 0, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccsycon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsycon( 'U', -1, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccsycon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccsycon( 'U', 2, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccsycon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccsycon( 'U', 1, A, 1, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccsycon', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a symmetric indefinite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        ccsptrf
*
         SRNAMT = 'ccsptrf'
         INFOT = 1
         CALL ccsptrf( '/', 0, A, IP, INFO )
         CALL CHKXER( 'ccsptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsptrf( 'U', -1, A, IP, INFO )
         CALL CHKXER( 'ccsptrf', INFOT, NOUT, LERR, OK )
*
*        ccsptri
*
         SRNAMT = 'ccsptri'
         INFOT = 1
         CALL ccsptri( '/', 0, A, IP, W, INFO )
         CALL CHKXER( 'ccsptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsptri( 'U', -1, A, IP, W, INFO )
         CALL CHKXER( 'ccsptri', INFOT, NOUT, LERR, OK )
*
*        ccsptrs
*
         SRNAMT = 'ccsptrs'
         INFOT = 1
         CALL ccsptrs( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsptrs( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsptrs( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccsptrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccsptrs( 'U', 2, 1, A, IP, B, 1, INFO )
         CALL CHKXER( 'ccsptrs', INFOT, NOUT, LERR, OK )
*
*        ccsprFS
*
         SRNAMT = 'ccsprFS'
         INFOT = 1
         CALL ccsprFS( '/', 0, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccsprFS( 'U', -1, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccsprFS( 'U', 0, -1, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccsprFS( 'U', 2, 1, A, AF, IP, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccsprFS', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL ccsprFS( 'U', 2, 1, A, AF, IP, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'ccsprFS', INFOT, NOUT, LERR, OK )
*
*        ccspcon
*
         SRNAMT = 'ccspcon'
         INFOT = 1
         CALL ccspcon( '/', 0, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccspcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccspcon( 'U', -1, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccspcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccspcon( 'U', 1, A, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'ccspcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRSY
*
      END
