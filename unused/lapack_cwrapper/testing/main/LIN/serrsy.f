      SUBROUTINE SERRSY( PATH, NUNIT )
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
*  SERRSY tests the error exits for the REAL routines
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
      INTEGER            IP( NMAX ), IW( NMAX )
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   R1( NMAX ), R2( NMAX ), W( 3*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csspcon, cssprfs, cssptrf, 
     $  cssptri, 
     $                   cssptrs, cssycon, cssyrfs, cssytf2, cssytrf, 
     $  cssytri, 
     $                   cssytrs
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
      ANRM = 1.0
      RCOND = 1.0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        Test error exits of the routines that use the Bunch-Kaufman
*        factorization of a symmetric indefinite matrix.
*
*        cssytrf
*
         SRNAMT = 'cssytrf'
         INFOT = 1
         CALL cssytrf( '/', 0, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'cssytrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssytrf( 'U', -1, A, 1, IP, W, 1, INFO )
         CALL CHKXER( 'cssytrf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssytrf( 'U', 2, A, 1, IP, W, 4, INFO )
         CALL CHKXER( 'cssytrf', INFOT, NOUT, LERR, OK )
*
*        cssytf2
*
         SRNAMT = 'cssytf2'
         INFOT = 1
         CALL cssytf2( '/', 0, A, 1, IP, INFO )
         CALL CHKXER( 'cssytf2', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssytf2( 'U', -1, A, 1, IP, INFO )
         CALL CHKXER( 'cssytf2', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssytf2( 'U', 2, A, 1, IP, INFO )
         CALL CHKXER( 'cssytf2', INFOT, NOUT, LERR, OK )
*
*        cssytri
*
         SRNAMT = 'cssytri'
         INFOT = 1
         CALL cssytri( '/', 0, A, 1, IP, W, INFO )
         CALL CHKXER( 'cssytri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssytri( 'U', -1, A, 1, IP, W, INFO )
         CALL CHKXER( 'cssytri', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssytri( 'U', 2, A, 1, IP, W, INFO )
         CALL CHKXER( 'cssytri', INFOT, NOUT, LERR, OK )
*
*        cssytrs
*
         SRNAMT = 'cssytrs'
         INFOT = 1
         CALL cssytrs( '/', 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cssytrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssytrs( 'U', -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cssytrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssytrs( 'U', 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'cssytrs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cssytrs( 'U', 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'cssytrs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssytrs( 'U', 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'cssytrs', INFOT, NOUT, LERR, OK )
*
*        cssyrfs
*
         SRNAMT = 'cssyrfs'
         INFOT = 1
         CALL cssyrfs( '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssyrfs( 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssyrfs( 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1, R1, R2,
     $                W, IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cssyrfs( 'U', 2, 1, A, 1, AF, 2, IP, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cssyrfs( 'U', 2, 1, A, 2, AF, 1, IP, B, 2, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssyrfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 1, X, 2, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cssyrfs( 'U', 2, 1, A, 2, AF, 2, IP, B, 2, X, 1, R1, R2, 
     $  W, 
     $                IW, INFO )
         CALL CHKXER( 'cssyrfs', INFOT, NOUT, LERR, OK )
*
*        cssycon
*
         SRNAMT = 'cssycon'
         INFOT = 1
         CALL cssycon( '/', 0, A, 1, IP, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cssycon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssycon( 'U', -1, A, 1, IP, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cssycon', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssycon( 'U', 2, A, 1, IP, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'cssycon', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cssycon( 'U', 1, A, 1, IP, -1.0, RCOND, W, IW, INFO )
         CALL CHKXER( 'cssycon', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        Test error exits of the routines that use the Bunch-Kaufman
*        factorization of a symmetric indefinite packed matrix.
*
*        cssptrf
*
         SRNAMT = 'cssptrf'
         INFOT = 1
         CALL cssptrf( '/', 0, A, IP, INFO )
         CALL CHKXER( 'cssptrf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssptrf( 'U', -1, A, IP, INFO )
         CALL CHKXER( 'cssptrf', INFOT, NOUT, LERR, OK )
*
*        cssptri
*
         SRNAMT = 'cssptri'
         INFOT = 1
         CALL cssptri( '/', 0, A, IP, W, INFO )
         CALL CHKXER( 'cssptri', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssptri( 'U', -1, A, IP, W, INFO )
         CALL CHKXER( 'cssptri', INFOT, NOUT, LERR, OK )
*
*        cssptrs
*
         SRNAMT = 'cssptrs'
         INFOT = 1
         CALL cssptrs( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cssptrs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssptrs( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'cssptrs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssptrs( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'cssptrs', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cssptrs( 'U', 2, 1, A, IP, B, 1, INFO )
         CALL CHKXER( 'cssptrs', INFOT, NOUT, LERR, OK )
*
*        cssprfs
*
         SRNAMT = 'cssprfs'
         INFOT = 1
         CALL cssprfs( '/', 0, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cssprfs', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssprfs( 'U', -1, 0, A, AF, IP, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cssprfs', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssprfs( 'U', 0, -1, A, AF, IP, B, 1, X, 1, R1, R2, W, 
     $  IW, 
     $                INFO )
         CALL CHKXER( 'cssprfs', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssprfs( 'U', 2, 1, A, AF, IP, B, 1, X, 2, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cssprfs', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cssprfs( 'U', 2, 1, A, AF, IP, B, 2, X, 1, R1, R2, W, IW,
     $                INFO )
         CALL CHKXER( 'cssprfs', INFOT, NOUT, LERR, OK )
*
*        csspcon
*
         SRNAMT = 'csspcon'
         INFOT = 1
         CALL csspcon( '/', 0, A, IP, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csspcon', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csspcon( 'U', -1, A, IP, ANRM, RCOND, W, IW, INFO )
         CALL CHKXER( 'csspcon', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csspcon( 'U', 1, A, IP, -1.0, RCOND, W, IW, INFO )
         CALL CHKXER( 'csspcon', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRSY
*
      END
