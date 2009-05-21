      SUBROUTINE CERRHE( PATH, NUNIT )
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
*  CERRHE tests the error exits for the COMPLEX routines
*  for Hermitian indefinite matrices.
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
      EXTERNAL      ALAESM, cchecon, ccherfs, cchetf2, cchetrf, cchetri,
     $              cchetrs, CHKXER, cchpcon, cchprfs, cchptrf, cchptri,
     $                   cchptrs
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
*     factorization of a Hermitian indefinite matrix.
*
      IF( LSAMEN( 2, C2, 'HE' ) ) THEN
*
*        cchetrf
*
         SRNAMT = 'cchetrf'
         INFOT = 1
         CALL cchetrf( '/', 0, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'cchetrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchetrf( 'U', -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'cchetrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchetrf( 'U', 2, A, 1, IP, W, 4, INFO )
         CALL CHKXER( 'cchetrf', INFOT, NOUT, LERR, OK )
*
*        cchetf2
*
         SRNAMT = 'cchetf2'
         INFOT = 1
         CALL cchetf2( '/', 0, A, 1, IP, INFO )
         CALL CHKXER( 'cchetf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchetf2( 'U', -1, A, 1, IP, INFO )
         CALL CHKXER( 'cchetf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchetf2( 'U', 2, A, 1, IP, INFO )
         CALL CHKXER( 'cchetf2', INFOT, NOUT, LERR, OK )
*
*        cchetri
*
         SRNAMT = 'cchetri'
         INFOT = 1
         CALL cchetri( '/', 0, A, 1, IP, W, INFO )
         CALL CHKXER( 'cchetri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchetri( 'U', -1, A, 1, IP, W, INFO )
         CALL CHKXER( 'cchetri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchetri( 'U', 2, A, 1, IP, W, INFO )
         CALL CHKXER( 'cchetri', INFOT, NOUT, LERR, OK )
*
*        cchetrs
*
         SRNAMT = 'cchetrs'
         INFOT = 1
         CALL cchetrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cchetrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchetrs( 'U', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cchetrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchetrs( 'U', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cchetrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchetrs( 'U', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'cchetrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cchetrs( 'U', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'cchetrs', INFOT, NOUT, LERR, OK )
*
*        ccherfs
*
         SRNAMT = 'ccherfs'
         INFOT = 1
        CALL ccherfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccherfs( 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccherfs( 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL ccherfs( 'U', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL ccherfs( 'U', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL ccherfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL ccherfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'ccherfs', INFOT, NOUT, LERR, OK )
*
*        cchecon
*
         SRNAMT = 'cchecon'
         INFOT = 1
         CALL cchecon( '/', 0, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchecon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchecon( 'U', -1, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchecon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchecon( 'U', 2, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchecon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cchecon( 'U', 1, A, 1, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchecon', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a Hermitian indefinite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'HP' ) ) THEN
*
*        cchptrf
*
         SRNAMT = 'cchptrf'
         INFOT = 1
         CALL cchptrf( '/', 0, A, IP, INFO )
         CALL CHKXER( 'cchptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchptrf( 'U', -1, A, IP, INFO )
         CALL CHKXER( 'cchptrf', INFOT, NOUT, LERR, OK )
*
*        cchptri
*
         SRNAMT = 'cchptri'
         INFOT = 1
         CALL cchptri( '/', 0, A, IP, W, INFO )
         CALL CHKXER( 'cchptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchptri( 'U', -1, A, IP, W, INFO )
         CALL CHKXER( 'cchptri', INFOT, NOUT, LERR, OK )
*
*        cchptrs
*
         SRNAMT = 'cchptrs'
         INFOT = 1
         CALL cchptrs( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchptrs( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchptrs( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchptrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchptrs( 'U', 2, 1, A, IP, B, 1, INFO )
         CALL CHKXER( 'cchptrs', INFOT, NOUT, LERR, OK )
*
*        cchprfs
*
         SRNAMT = 'cchprfs'
         INFOT = 1
         CALL cchprfs( '/', 0, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'cchprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchprfs( 'U', -1, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'cchprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchprfs( 'U', 0, -1, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'cchprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cchprfs( 'U', 2, 1, A, AF, IP, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'cchprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cchprfs( 'U', 2, 1, A, AF, IP, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'cchprfs', INFOT, NOUT, LERR, OK )
*
*        cchpcon
*
         SRNAMT = 'cchpcon'
         INFOT = 1
         CALL cchpcon( '/', 0, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchpcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchpcon( 'U', -1, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchpcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchpcon( 'U', 1, A, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'cchpcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRHE
*
      END
