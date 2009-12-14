      SUBROUTINE ZERRVX( PATH, NUNIT )
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
*  ZERRVX tests the error exits for the COMPLEX*16 driver routines
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
      DOUBLE PRECISION   RCOND
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      DOUBLE PRECISION   C( NMAX ), R( NMAX ), R1( NMAX ), R2( NMAX ),
     $                   RF( NMAX ), RW( NMAX )
      COMPLEX*16         A( NMAX, NMAX ), AF( NMAX, NMAX ), B( NMAX ),
     $                   W( 2*NMAX ), X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL         CHKXER, czgbsv, czgbsvX, czgesv, czgesvX, czgtsv,
     $                czgtsvX, czhesv, czhesvX, czhpsv, czhpsvX, czpbsv,
     $                czpbsvX, czposv, czposvX, czppsv, czppsvX, czptsv,
     $                   czptsvX, czspsv, czspsvX, czsysv, czsysvX
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
         C( J ) = 0.D0
         R( J ) = 0.D0
         IP( J ) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'GE' ) ) THEN
*
*        czgesv
*
         SRNAMT = 'czgesv '
         INFOT = 1
         CALL czgesv( -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgesv( 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgesv( 2, 1, A, 1, IP, B, 2, INFO )
         CALL CHKXER( 'czgesv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czgesv( 2, 1, A, 2, IP, B, 1, INFO )
         CALL CHKXER( 'czgesv ', INFOT, NOUT, LERR, OK )
*
*        czgesvX
*
         SRNAMT = 'czgesvX'
         INFOT = 1
         CALL czgesvX( '/', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgesvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgesvX( 'N', 'N', -1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgesvX( 'N', 'N', 0, -1, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgesvX( 'N', 'N', 2, 1, A, 1, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgesvX( 'N', 'N', 2, 1, A, 2, AF, 1, IP, EQ, R, C, B, 2,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
         CALL czgesvX( 'F', 'N', 0, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'R'
         CALL czgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = 'C'
         CALL czgesvX( 'F', 'N', 1, 0, A, 1, AF, 1, IP, EQ, R, C, B, 1,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 1,
     $                X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czgesvX( 'N', 'N', 2, 1, A, 2, AF, 2, IP, EQ, R, C, B, 2,
     $                X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgesvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GB' ) ) THEN
*
*        czgbsv
*
         SRNAMT = 'czgbsv '
         INFOT = 1
         CALL czgbsv( -1, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbsv( 1, -1, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbsv( 1, 0, -1, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbsv( 0, 0, 0, -1, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbsv( 1, 1, 1, 0, A, 3, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czgbsv( 2, 0, 0, 0, A, 1, IP, B, 1, INFO )
         CALL CHKXER( 'czgbsv ', INFOT, NOUT, LERR, OK )
*
*        czgbsvX
*
         SRNAMT = 'czgbsvX'
         INFOT = 1
         CALL czgbsvX( '/', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgbsvX( 'N', '/', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgbsvX( 'N', 'N', -1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgbsvX( 'N', 'N', 1, -1, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czgbsvX( 'N', 'N', 1, 0, -1, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czgbsvX( 'N', 'N', 0, 0, 0, -1, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czgbsvX( 'N', 'N', 1, 1, 1, 0, A, 2, AF, 4, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czgbsvX( 'N', 'N', 1, 1, 1, 0, A, 3, AF, 3, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         EQ = '/'
         CALL czgbsvX( 'F', 'N', 0, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         EQ = 'R'
         CALL czgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         EQ = 'C'
         CALL czgbsvX( 'F', 'N', 1, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 1, X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czgbsvX( 'N', 'N', 2, 0, 0, 0, A, 1, AF, 1, IP, EQ, R, C,
     $                B, 2, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'GT' ) ) THEN
*
*        czgtsv
*
         SRNAMT = 'czgtsv '
         INFOT = 1
         CALL czgtsv( -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'czgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgtsv( 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1,
     $               INFO )
         CALL CHKXER( 'czgtsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czgtsv( 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ), B, 1, INFO )
         CALL CHKXER( 'czgtsv ', INFOT, NOUT, LERR, OK )
*
*        czgtsvX
*
         SRNAMT = 'czgtsvX'
         INFOT = 1
         CALL czgtsvX( '/', 'N', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czgtsvX( 'N', '/', 0, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czgtsvX( 'N', 'N', -1, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czgtsvX( 'N', 'N', 0, -1, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 1, X, 2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
         INFOT = 16
         CALL czgtsvX( 'N', 'N', 2, 0, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                AF( 1, 1 ), AF( 1, 2 ), AF( 1, 3 ), AF( 1, 4 ),
     $                IP, B, 2, X, 1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czgtsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PO' ) ) THEN
*
*        czposv
*
         SRNAMT = 'czposv '
         INFOT = 1
         CALL czposv( '/', 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czposv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czposv( 'U', -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czposv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czposv( 'U', 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czposv ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czposv( 'U', 2, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'czposv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czposv( 'U', 2, 0, A, 2, B, 1, INFO )
         CALL CHKXER( 'czposv ', INFOT, NOUT, LERR, OK )
*
*        czposvX
*
         SRNAMT = 'czposvX'
         INFOT = 1
         CALL czposvX( '/', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czposvX( 'N', '/', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czposvX( 'N', 'U', -1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czposvX( 'N', 'U', 0, -1, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czposvX( 'N', 'U', 2, 0, A, 1, AF, 2, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czposvX( 'N', 'U', 2, 0, A, 2, AF, 1, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         EQ = '/'
         CALL czposvX( 'F', 'U', 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = 'Y'
         CALL czposvX( 'F', 'U', 1, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 1, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
         INFOT = 14
         CALL czposvX( 'N', 'U', 2, 0, A, 2, AF, 2, EQ, C, B, 2, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czposvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PP' ) ) THEN
*
*        czppsv
*
         SRNAMT = 'czppsv '
         INFOT = 1
         CALL czppsv( '/', 0, 0, A, B, 1, INFO )
         CALL CHKXER( 'czppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czppsv( 'U', -1, 0, A, B, 1, INFO )
         CALL CHKXER( 'czppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czppsv( 'U', 0, -1, A, B, 1, INFO )
         CALL CHKXER( 'czppsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czppsv( 'U', 2, 0, A, B, 1, INFO )
         CALL CHKXER( 'czppsv ', INFOT, NOUT, LERR, OK )
*
*        czppsvX
*
         SRNAMT = 'czppsvX'
         INFOT = 1
         CALL czppsvX( '/', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czppsvX( 'N', '/', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czppsvX( 'N', 'U', -1, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czppsvX( 'N', 'U', 0, -1, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
         EQ = '/'
         CALL czppsvX( 'F', 'U', 0, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         EQ = 'Y'
         CALL czppsvX( 'F', 'U', 1, 0, A, AF, EQ, C, B, 1, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL czppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 1, X, 2, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL czppsvX( 'N', 'U', 2, 0, A, AF, EQ, C, B, 2, X, 1, RCOND,
     $                R1, R2, W, RW, INFO )
         CALL CHKXER( 'czppsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PB' ) ) THEN
*
*        czpbsv
*
         SRNAMT = 'czpbsv '
         INFOT = 1
         CALL czpbsv( '/', 0, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czpbsv( 'U', -1, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbsv( 'U', 1, -1, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpbsv( 'U', 0, 0, -1, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czpbsv( 'U', 1, 1, 0, A, 1, B, 2, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czpbsv( 'U', 2, 0, 0, A, 1, B, 1, INFO )
         CALL CHKXER( 'czpbsv ', INFOT, NOUT, LERR, OK )
*
*        czpbsvX
*
         SRNAMT = 'czpbsvX'
         INFOT = 1
        CALL czpbsvX( '/', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
        INFOT = 2
        CALL czpbsvX( 'N', '/', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czpbsvX( 'N', 'U', -1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czpbsvX( 'N', 'U', 1, -1, 0, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czpbsvX( 'N', 'U', 0, 0, -1, A, 1, AF, 1, EQ, C, B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL czpbsvX( 'N', 'U', 1, 1, 0, A, 1, AF, 2, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
        CALL czpbsvX( 'N', 'U', 1, 1, 0, A, 2, AF, 1, EQ, C, B, 2, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 10
         EQ = '/'
        CALL czpbsvX( 'F', 'U', 0, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         EQ = 'Y'
        CALL czpbsvX( 'F', 'U', 1, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL czpbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 1, X, 2,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
         INFOT = 15
        CALL czpbsvX( 'N', 'U', 2, 0, 0, A, 1, AF, 1, EQ, C, B, 2, X, 1,
     $                RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czpbsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'PT' ) ) THEN
*
*        czptsv
*
         SRNAMT = 'czptsv '
         INFOT = 1
         CALL czptsv( -1, 0, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'czptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czptsv( 0, -1, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'czptsv ', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czptsv( 2, 0, R, A( 1, 1 ), B, 1, INFO )
         CALL CHKXER( 'czptsv ', INFOT, NOUT, LERR, OK )
*
*        czptsvX
*
         SRNAMT = 'czptsvX'
         INFOT = 1
         CALL czptsvX( '/', 0, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL czptsvX( 'N', -1, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czptsvX( 'N', 0, -1, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czptsvX( 'N', 2, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 1, X,
     $                2, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czptsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czptsvX( 'N', 2, 0, R, A( 1, 1 ), RF, AF( 1, 1 ), B, 2, X,
     $                1, RCOND, R1, R2, W, RW, INFO )
         CALL CHKXER( 'czptsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'HE' ) ) THEN
*
*        czhesv
*
         SRNAMT = 'czhesv '
         INFOT = 1
         CALL czhesv( '/', 0, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czhesv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhesv( 'U', -1, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czhesv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhesv( 'U', 0, -1, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czhesv ', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL czhesv( 'U', 2, 0, A, 1, IP, B, 2, W, 1, INFO )
         CALL CHKXER( 'czhesv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhesv( 'U', 2, 0, A, 2, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czhesv ', INFOT, NOUT, LERR, OK )
*
*        czhesvX
*
         SRNAMT = 'czhesvX'
         INFOT = 1
         CALL czhesvX( '/', 'U', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhesvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhesvX( 'N', 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czhesvX( 'N', 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czhesvX( 'N', 'U', 2, 0, A, 1, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czhesvX( 'N', 'U', 2, 0, A, 2, AF, 1, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 1, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czhesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 1,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czhesvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 3, RW, INFO )
         CALL CHKXER( 'czhesvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'HP' ) ) THEN
*
*        czhpsv
*
         SRNAMT = 'czhpsv '
         INFOT = 1
         CALL czhpsv( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpsv( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czhpsv( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhpsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czhpsv( 'U', 2, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czhpsv ', INFOT, NOUT, LERR, OK )
*
*        czhpsvX
*
         SRNAMT = 'czhpsvX'
         INFOT = 1
         CALL czhpsvX( '/', 'U', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czhpsvX( 'N', '/', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czhpsvX( 'N', 'U', -1, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL czhpsvX( 'N', 'U', 0, -1, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czhpsvX( 'N', 'U', 2, 0, A, AF, IP, B, 1, X, 2, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czhpsvX( 'N', 'U', 2, 0, A, AF, IP, B, 2, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czhpsvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SY' ) ) THEN
*
*        czsysv
*
         SRNAMT = 'czsysv '
         INFOT = 1
         CALL czsysv( '/', 0, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsysv( 'U', -1, 0, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsysv( 'U', 0, -1, A, 1, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czsysv ', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czsysv( 'U', 2, 0, A, 2, IP, B, 1, W, 1, INFO )
         CALL CHKXER( 'czsysv ', INFOT, NOUT, LERR, OK )
*
*        czsysvX
*
         SRNAMT = 'czsysvX'
         INFOT = 1
         CALL czsysvX( '/', 'U', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czsysvX( 'N', '/', 0, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czsysvX( 'N', 'U', -1, 0, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL czsysvX( 'N', 'U', 0, -1, A, 1, AF, 1, IP, B, 1, X, 1,
     $                RCOND, R1, R2, W, 1, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL czsysvX( 'N', 'U', 2, 0, A, 1, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL czsysvX( 'N', 'U', 2, 0, A, 2, AF, 1, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 1, X, 2,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL czsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 1,
     $                RCOND, R1, R2, W, 4, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
         INFOT = 18
         CALL czsysvX( 'N', 'U', 2, 0, A, 2, AF, 2, IP, B, 2, X, 2,
     $                RCOND, R1, R2, W, 3, RW, INFO )
         CALL CHKXER( 'czsysvX', INFOT, NOUT, LERR, OK )
*
      ELSE IF( LSAMEN( 2, C2, 'SP' ) ) THEN
*
*        czspsv
*
         SRNAMT = 'czspsv '
         INFOT = 1
         CALL czspsv( '/', 0, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czspsv( 'U', -1, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL czspsv( 'U', 0, -1, A, IP, B, 1, INFO )
         CALL CHKXER( 'czspsv ', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL czspsv( 'U', 2, 0, A, IP, B, 1, INFO )
         CALL CHKXER( 'czspsv ', INFOT, NOUT, LERR, OK )
*
*        czspsvX
*
         SRNAMT = 'czspsvX'
         INFOT = 1
         CALL czspsvX( '/', 'U', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL czspsvX( 'N', '/', 0, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL czspsvX( 'N', 'U', -1, 0, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 4
        CALL czspsvX( 'N', 'U', 0, -1, A, AF, IP, B, 1, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL czspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 1, X, 2, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL czspsvX( 'N', 'U', 2, 0, A, AF, IP, B, 2, X, 1, RCOND, R1,
     $                R2, W, RW, INFO )
         CALL CHKXER( 'czspsvX', INFOT, NOUT, LERR, OK )
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
*     End of ZERRVX
*
      END
