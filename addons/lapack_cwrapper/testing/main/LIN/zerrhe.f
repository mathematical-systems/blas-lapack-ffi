      SUBROUTINE ZERRHE( PATH, NUNIT )
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
*  ZERRHE tests the error exits for the COMPLEX*16 routines
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
      EXTERNAL       ALAESM, CHKXER, czhecon, czherfs, czhetf2, czhetrf,
     $             czhetri, czhetrs, czhpcon, czhprfs, czhptrf, czhptri,
     $                   czhptrs
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
*     factorization of a Hermitian indefinite matrix.
*
      IF( LSAMEN( 2, C2, 'HE' ) ) THEN
*
*        czhetrf
*
         SRNAMT = 'czhetrf'
         INFOT = 1
         CALL czhetrf( '/', 0, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'czhetrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhetrf( 'U', -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'czhetrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhetrf( 'U', 2, A, 1, IP, W, 4, INFO )
         CALL CHKXER( 'czhetrf', INFOT, NOUT, LERR, OK )
*
*        czhetf2
*
         SRNAMT = 'czhetf2'
         INFOT = 1
         CALL czhetf2( '/', 0, A, 1, IP, INFO )
         CALL CHKXER( 'czhetf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhetf2( 'U', -1, A, 1, IP, INFO )
         CALL CHKXER( 'czhetf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhetf2( 'U', 2, A, 1, IP, INFO )
         CALL CHKXER( 'czhetf2', INFOT, NOUT, LERR, OK )
*
*        czhetri
*
         SRNAMT = 'czhetri'
         INFOT = 1
         CALL czhetri( '/', 0, A, 1, IP, W, INFO )
         CALL CHKXER( 'czhetri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhetri( 'U', -1, A, 1, IP, W, INFO )
         CALL CHKXER( 'czhetri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhetri( 'U', 2, A, 1, IP, W, INFO )
         CALL CHKXER( 'czhetri', INFOT, NOUT, LERR, OK )
*
*        czhetrs
*
         SRNAMT = 'czhetrs'
         INFOT = 1
         CALL czhetrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czhetrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhetrs( 'U', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czhetrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhetrs( 'U', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czhetrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czhetrs( 'U', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'czhetrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhetrs( 'U', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'czhetrs', INFOT, NOUT, LERR, OK )
*
*        czherfs
*
         SRNAMT = 'czherfs'
         INFOT = 1
        CALL czherfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czherfs( 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czherfs( 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
        CALL czherfs( 'U', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czherfs( 'U', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
        CALL czherfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
        CALL czherfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, W,
     $                R, INFO )
         CALL CHKXER( 'czherfs', INFOT, NOUT, LERR, OK )
*
*        czhecon
*
         SRNAMT = 'czhecon'
         INFOT = 1
         CALL czhecon( '/', 0, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhecon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhecon( 'U', -1, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhecon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhecon( 'U', 2, A, 1, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhecon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czhecon( 'U', 1, A, 1, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhecon', INFOT, NOUT, LERR, OK )
*
*     Test error exits of the routines that use the diagonal pivoting
*     factorization of a Hermitian indefinite packed matrix.
*
      ELSE IF( LSAMEN( 2, C2, 'HP' ) ) THEN
*
*        czhptrf
*
         SRNAMT = 'czhptrf'
         INFOT = 1
         CALL czhptrf( '/', 0, A, IP, INFO )
         CALL CHKXER( 'czhptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhptrf( 'U', -1, A, IP, INFO )
         CALL CHKXER( 'czhptrf', INFOT, NOUT, LERR, OK )
*
*        czhptri
*
         SRNAMT = 'czhptri'
         INFOT = 1
         CALL czhptri( '/', 0, A, IP, W, INFO )
         CALL CHKXER( 'czhptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhptri( 'U', -1, A, IP, W, INFO )
         CALL CHKXER( 'czhptri', INFOT, NOUT, LERR, OK )
*
*        czhptrs
*
         SRNAMT = 'czhptrs'
         INFOT = 1
         CALL czhptrs( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhptrs( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhptrs( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhptrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhptrs( 'U', 2, 1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhptrs', INFOT, NOUT, LERR, OK )
*
*        czhprfs
*
         SRNAMT = 'czhprfs'
         INFOT = 1
         CALL czhprfs( '/', 0, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czhprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhprfs( 'U', -1, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czhprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhprfs( 'U', 0, -1, A, AF, IP, B, 1, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czhprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhprfs( 'U', 2, 1, A, AF, IP, B, 1, X, 2, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czhprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czhprfs( 'U', 2, 1, A, AF, IP, B, 2, X, 1, R1, R2, W, R,
     $                INFO )
         CALL CHKXER( 'czhprfs', INFOT, NOUT, LERR, OK )
*
*        czhpcon
*
         SRNAMT = 'czhpcon'
         INFOT = 1
         CALL czhpcon( '/', 0, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhpcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpcon( 'U', -1, A, IP, ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhpcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czhpcon( 'U', 1, A, IP, -ANRM, RCOND, W, INFO )
         CALL CHKXER( 'czhpcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRHE
*
      END
