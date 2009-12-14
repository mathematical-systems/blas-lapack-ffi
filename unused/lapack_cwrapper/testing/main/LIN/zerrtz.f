      SUBROUTINE ZERRTZ( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  ZERRTZ tests the error exits for cztzrqf and cztzrzf.
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
      PARAMETER          ( NMAX = 2 )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            INFO
*     ..
*     .. Local Arrays ..
      COMPLEX*16         A( NMAX, NMAX ), TAU( NMAX ), W( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, cztzrqf, cztzrzf
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
      INTRINSIC          DCMPLX
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      C2 = PATH( 2: 3 )
      A( 1, 1 ) = DCMPLX( 1.D+0, -1.D+0 )
      A( 1, 2 ) = DCMPLX( 2.D+0, -2.D+0 )
      A( 2, 2 ) = DCMPLX( 3.D+0, -3.D+0 )
      A( 2, 1 ) = DCMPLX( 4.D+0, -4.D+0 )
      W( 1 ) = DCMPLX( 0.D+0, 0.D+0 )
      W( 2 ) = DCMPLX( 0.D+0, 0.D+0 )
      OK = .TRUE.
*
*     Test error exits for the trapezoidal routines.
*
      WRITE( NOUT, FMT = * )
      IF( LSAMEN( 2, C2, 'TZ' ) ) THEN
*
*        cztzrqf
*
         SRNAMT = 'cztzrqf'
         INFOT = 1
         CALL cztzrqf( -1, 0, A, 1, TAU, INFO )
         CALL CHKXER( 'cztzrqf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztzrqf( 1, 0, A, 1, TAU, INFO )
         CALL CHKXER( 'cztzrqf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztzrqf( 2, 2, A, 1, TAU, INFO )
         CALL CHKXER( 'cztzrqf', INFOT, NOUT, LERR, OK )
*
*        cztzrzf
*
         SRNAMT = 'cztzrzf'
         INFOT = 1
         CALL cztzrzf( -1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cztzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cztzrzf( 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cztzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cztzrzf( 2, 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cztzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cztzrzf( 2, 2, A, 2, TAU, W, 1, INFO )
         CALL CHKXER( 'cztzrzf', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of ZERRTZ
*
      END
