      SUBROUTINE CERRQP( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 6, 2000 
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  CERRQP tests the error exits for ccgeqpf and ccgeqp3.
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
      PARAMETER          ( NMAX = 3 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            INFO, LW
*     ..
*     .. Local Arrays ..
      INTEGER            IP( NMAX )
      REAL               RW( 2*NMAX )
      COMPLEX            A( NMAX, NMAX ), TAU( NMAX ),
     $                   W( 2*NMAX+3*NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, ccgeqp3, ccgeqpf, CHKXER
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
      INTRINSIC          CMPLX
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      C2 = PATH( 2: 3 )
      LW = NMAX + 1
      A( 1, 1 ) = CMPLX( 1.0E+0, -1.0E+0 )
      A( 1, 2 ) = CMPLX( 2.0E+0, -2.0E+0 )
      A( 2, 2 ) = CMPLX( 3.0E+0, -3.0E+0 )
      A( 2, 1 ) = CMPLX( 4.0E+0, -4.0E+0 )
      OK = .TRUE.
      WRITE( NOUT, FMT = * )
*
*     Test error exits for QR factorization with pivoting
*
      IF( LSAMEN( 2, C2, 'QP' ) ) THEN
*
*        ccgeqpf
*
         SRNAMT = 'ccgeqpf'
         INFOT = 1
         CALL ccgeqpf( -1, 0, A, 1, IP, TAU, W, RW, INFO )
         CALL CHKXER( 'ccgeqpf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeqpf( 0, -1, A, 1, IP, TAU, W, RW, INFO )
         CALL CHKXER( 'ccgeqpf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgeqpf( 2, 0, A, 1, IP, TAU, W, RW, INFO )
         CALL CHKXER( 'ccgeqpf', INFOT, NOUT, LERR, OK )
*
*        ccgeqp3
*
         SRNAMT = 'ccgeqp3'
         INFOT = 1
         CALL ccgeqp3( -1, 0, A, 1, IP, TAU, W, LW, RW, INFO )
         CALL CHKXER( 'ccgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgeqp3( 1, -1, A, 1, IP, TAU, W, LW, RW, INFO )
         CALL CHKXER( 'ccgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgeqp3( 2, 3, A, 1, IP, TAU, W, LW, RW, INFO )
         CALL CHKXER( 'ccgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgeqp3( 2, 2, A, 2, IP, TAU, W, LW-10, RW, INFO )
         CALL CHKXER( 'ccgeqp3', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of CERRQP
*
      END
