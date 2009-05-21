      SUBROUTINE SERRQP( PATH, NUNIT )
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
*  SERRQP tests the error exits for csgeqpf and csgeqp3.
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
      REAL               A( NMAX, NMAX ), TAU( NMAX ), W( 3*NMAX+1 )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, csgeqp3, csgeqpf
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
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
      LW = 3*NMAX + 1
      A( 1, 1 ) = 1.0E+0
      A( 1, 2 ) = 2.0E+0
      A( 2, 2 ) = 3.0E+0
      A( 2, 1 ) = 4.0E+0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'QP' ) ) THEN
*
*        Test error exits for QR factorization with pivoting
*
*        csgeqpf
*
         SRNAMT = 'csgeqpf'
         INFOT = 1
         CALL csgeqpf( -1, 0, A, 1, IP, TAU, W, INFO )
         CALL CHKXER( 'csgeqpf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgeqpf( 0, -1, A, 1, IP, TAU, W, INFO )
         CALL CHKXER( 'csgeqpf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgeqpf( 2, 0, A, 1, IP, TAU, W, INFO )
         CALL CHKXER( 'csgeqpf', INFOT, NOUT, LERR, OK )
*
*        csgeqp3
*
         SRNAMT = 'csgeqp3'
         INFOT = 1
         CALL csgeqp3( -1, 0, A, 1, IP, TAU, W, LW, INFO )
         CALL CHKXER( 'csgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgeqp3( 1, -1, A, 1, IP, TAU, W, LW, INFO )
         CALL CHKXER( 'csgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgeqp3( 2, 3, A, 1, IP, TAU, W, LW, INFO )
         CALL CHKXER( 'csgeqp3', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgeqp3( 2, 2, A, 2, IP, TAU, W, LW-10, INFO )
         CALL CHKXER( 'csgeqp3', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRQP
*
      END
