      SUBROUTINE SERRVX( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 31, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  SERRVX tests the error exits for the REAL driver routines
*  for solving linear systems of equations.
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
      CHARACTER          EQ
      CHARACTER*2        C2
      INTEGER            I, INFO, J
      REAL               RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX ), IW( NMAX )
      REAL               A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   C( NMAX ), R( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           CHKXER, csgbsv, csgbsvX, csgesv, csgesvX, 
     $  csgtsv, 
     $                   csgtsvX, cspbsv, cspbsvX, csposv, csposvX, 
     $  csppsv, 
     $                   csppsvX, csptsv, csptsvX, csspsv, csspsvX, 
     $  cssysv, 
     $                   cssysvX
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
         C( J ) = 0.
         R( J ) = 0.
         IP( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        csgesv
*
         SRNAMT = 'csgesv '
         INFOT = 1
         CALL csgesv( -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgesv( 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgesv( 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'csgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgesv( 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'csgesv ', INFOT, NOUT, LERR, OK )
*
*        csgesvX
*
         SRNAMT = 'csgesvX'
         INFOT = 1
         CALL csgesvX( '/', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgesvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgesvX( 'N', 'N', -1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 
     $  1, 
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgesvX( 'N', 'N', 0, -1, A, 1, AF, 1, IP, EQ, R, C, B, 
     $  1, 
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgesvX( 'N', 'N', 2, 1, A, 1, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgesvX( 'N', 'N', 2, 1, A, 2, AF, 1, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
         CALL csgesvX( 'F', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'R'
         CALL csgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = 'C'
         CALL csgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 1,
     $                X, 2, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgesvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        csgbsv
*
         SRNAMT = 'csgbsv '
         INFOT = 1
         CALL csgbsv( -1, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbsv( 1, -1, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbsv( 1, 0, -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbsv( 0, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbsv( 1, 1, 1, 0, A, 3, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csgbsv( 2, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'csgbsv ', INFOT, NOUT, LERR, OK )
*
*        csgbsvX
*
         SRNAMT = 'csgbsvX'
         INFOT = 1
         CALL csgbsvX( '/', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgbsvX( 'N', '/', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgbsvX( 'N', 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, 
     $  C, 
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgbsvX( 'N', 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, EQ, R, 
     $  C, 
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgbsvX( 'N', 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, EQ, R, 
     $  C, 
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csgbsvX( 'N', 'N', 0, 0, 0, -1, A, 1, AF, 1, IP, EQ, R, 
     $  C, 
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgbsvX( 'N', 'N', 1, 1, 1, 0, A, 2, AF, 4, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csgbsvX( 'N', 'N', 1, 1, 1, 0, A, 3, AF, 3, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = '/'
         CALL csgbsvX( 'F', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         EQ = 'R'
         CALL csgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         EQ = 'C'
         CALL csgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 2, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL csgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 2, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        csgtsv
*
         SRNAMT = 'csgtsv '
         INFOT = 1
         CALL csgtsv( -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'csgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgtsv( 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'csgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgtsv( 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1, INFO 
     $  ) 
         CALL CHKXER( 'csgtsv ', INFOT, NOUT, LERR, OK )
*
*        csgtsvX
*
         SRNAMT = 'csgtsvX'
         INFOT = 1
         CALL csgtsvX( '/', 'N', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgtsvX( 'N', '/', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgtsvX( 'N', 'N', -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 
     $  ), 
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgtsvX( 'N', 'N', 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 
     $  ), 
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 2, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL csgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 2, X, 1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csgtsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        csposv
*
         SRNAMT = 'csposv '
         INFOT = 1
         CALL csposv( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'csposv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csposv( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'csposv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csposv( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'csposv ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csposv( 'U', 2, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'csposv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csposv( 'U', 2, 0, A, 2, B, 1, INFO )
         CALL CHKXER( 'csposv ', INFOT, NOUT, LERR, OK )
*
*        csposvX
*
         SRNAMT = 'csposvX'
         INFOT = 1
         CALL csposvX( '/', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csposvX( 'N', '/', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csposvX( 'N', 'U', -1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csposvX( 'N', 'U', 0, -1, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csposvX( 'N', 'U', 2, 0, A, 1, AF, 2, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csposvX( 'N', 'U', 2, 0, A, 2, AF, 1, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         EQ = '/'
         CALL csposvX( 'F', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = 'Y'
         CALL csposvX( 'F', 'U', 1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 1, X, 2,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL csposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 2, X, 1,
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'csposvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        csppsv
*
         SRNAMT = 'csppsv '
         INFOT = 1
         CALL csppsv( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'csppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csppsv( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'csppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csppsv( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'csppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csppsv( 'U', 2, 0, A, B, 1, INFO )
         CALL CHKXER( 'csppsv ', INFOT, NOUT, LERR, OK )
*
*        csppsvX
*
         SRNAMT = 'csppsvX'
         INFOT = 1
         CALL csppsvX( '/', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csppsvX( 'N', '/', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csppsvX( 'N', 'U', -1, 0, A, AF, EQ, C, B, 1, X, 1, 
     $  RCOND, 
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csppsvX( 'N', 'U', 0, -1, A, AF, EQ, C, B, 1, X, 1, 
     $  RCOND, 
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         EQ = '/'
         CALL csppsvX( 'F', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         EQ = 'Y'
         CALL csppsvX( 'F', 'U', 1, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL csppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 1, X, 2, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL csppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 2, X, 1, RCOND,
     $                R1, R2, W, IW, INFO )
         CALL CHKXER( 'csppsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        cspbsv
*
         SRNAMT = 'cspbsv '
         INFOT = 1
         CALL cspbsv( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbsv( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbsv( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspbsv( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cspbsv( 'U', 1, 1, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cspbsv( 'U', 2, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'cspbsv ', INFOT, NOUT, LERR, OK )
*
*        cspbsvX
*
         SRNAMT = 'cspbsvX'
         INFOT = 1
         CALL cspbsvX( '/', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 
     $  1, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cspbsvX( 'N', '/', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 
     $  1, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cspbsvX( 'N', 'U', -1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cspbsvX( 'N', 'U', 1, -1, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cspbsvX( 'N', 'U', 0, 0, -1, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cspbsvX( 'N', 'U', 1, 1, 0, A, 1, AF, 2, EQ, C, B, 2, X, 
     $  2, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cspbsvX( 'N', 'U', 1, 1, 0, A, 2, AF, 1, EQ, C, B, 2, X, 
     $  2, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
         CALL cspbsvX( 'F', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 
     $  1, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'Y'
         CALL cspbsvX( 'F', 'U', 1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 
     $  1, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cspbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 
     $  2, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 15
         CALL cspbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 2, X, 
     $  1, 
     $                RCOND, R1, R2, W, IW, INFO )
         CALL CHKXER( 'cspbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        csptsv
*
         SRNAMT = 'csptsv '
         INFOT = 1
         CALL csptsv( -1, 0, A( 1, 1 ), A( 1, 2 ), B, 1, INFO )
         CALL CHKXER( 'csptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csptsv( 0, -1, A( 1, 1 ), A( 1, 2 ), B, 1, INFO )
         CALL CHKXER( 'csptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csptsv( 2, 0, A( 1, 1 ), A( 1, 2 ), B, 1, INFO )
         CALL CHKXER( 'csptsv ', INFOT, NOUT, LERR, OK )
*
*        csptsvX
*
         SRNAMT = 'csptsvX'
         INFOT = 1
         CALL csptsvX( '/', 0, 0, A( 1, 1 ), A( 1, 2 ), AF( 1, 1 ),
     $                AF( 1, 2 ), B, 1, X, 1, RCOND, R1, R2, W, INFO )
         CALL CHKXER( 'csptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csptsvX( 'N', -1, 0, A( 1, 1 ), A( 1, 2 ), AF( 1, 1 ),
     $                AF( 1, 2 ), B, 1, X, 1, RCOND, R1, R2, W, INFO )
         CALL CHKXER( 'csptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csptsvX( 'N', 0, -1, A( 1, 1 ), A( 1, 2 ), AF( 1, 1 ),
     $                AF( 1, 2 ), B, 1, X, 1, RCOND, R1, R2, W, INFO )
         CALL CHKXER( 'csptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csptsvX( 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), AF( 1, 1 ),
     $                AF( 1, 2 ), B, 1, X, 2, RCOND, R1, R2, W, INFO )
         CALL CHKXER( 'csptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csptsvX( 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), AF( 1, 1 ),
     $                AF( 1, 2 ), B, 2, X, 1, RCOND, R1, R2, W, INFO )
         CALL CHKXER( 'csptsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        cssysv
*
         SRNAMT = 'cssysv '
         INFOT = 1
         CALL cssysv( '/', 0, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cssysv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssysv( 'U', -1, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cssysv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssysv( 'U', 0, -1, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cssysv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssysv( 'U', 2, 0, A, 2, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'cssysv ', INFOT, NOUT, LERR, OK )
*
*        cssysvX
*
         SRNAMT = 'cssysvX'
         INFOT = 1
         CALL cssysvX( '/', 'U', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cssysvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cssysvX( 'N', 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cssysvX( 'N', 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cssysvX( 'N', 'U', 2, 0, A, 1, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cssysvX( 'N', 'U', 2, 0, A, 2, AF, 1, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cssysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 1, X, 2,
     $                RCOND, R1, R2, W, 4, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cssysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 1,
     $                RCOND, R1, R2, W, 4, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL cssysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 3, IW, INFO )
         CALL CHKXER( 'cssysvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        csspsv
*
         SRNAMT = 'csspsv '
         INFOT = 1
         CALL csspsv( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'csspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csspsv( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'csspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csspsv( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'csspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csspsv( 'U', 2, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'csspsv ', INFOT, NOUT, LERR, OK )
*
*        csspsvX
*
         SRNAMT = 'csspsvX'
         INFOT = 1
         CALL csspsvX( '/', 'U', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csspsvX( 'N', '/', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csspsvX( 'N', 'U', -1, 0, A, AF, IP, B, 1, X, 1, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csspsvX( 'N', 'U', 0, -1, A, AF, IP, B, 1, X, 1, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 1, X, 2, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 2, X, 1, RCOND, 
     $  R1, 
     $                R2, W, IW, INFO )
         CALL CHKXER( 'csspsvX', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      IF( OK ) THEN
         WRITE( NOUT, FMT = 9999 )PATH
      ELSE
         WRITE( NOUT, FMT = 9998 )PATH
      END IF
*
 9999 FORMAT( 1X, A3, ' drivers passed the tests of the error exits' )
 9998 FORMAT( ' *** ', A3, ' drivers failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of SERRVX
*
      END
