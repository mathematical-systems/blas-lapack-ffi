      SUBROUTINE SERRTZ( PATH, NUNIT )
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
*  SERRTZ tests the error exits for cstzrqf and cstzrzf.
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
      REAL               A( NMAX, NMAX ), TAU( NMAX ), W( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAESM, CHKXER, cstzrqf, cstzrzf
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
      A( 1, 1 ) = 1.E+0
      A( 1, 2 ) = 2.E+0
      A( 2, 2 ) = 3.E+0
      A( 2, 1 ) = 4.E+0
      W( 1 ) = 0.0E+0
      W( 2 ) = 0.0E+0
      OK = .TRUE.
*
      IF( LSAMEN( 2, C2, 'TZ' ) ) THEN
*
*        Test error exits for the trapezoidal routines.
*
*        cstzrqf
*
         SRNAMT = 'cstzrqf'
         INFOT = 1
         CALL cstzrqf( -1, 0, A, 1, TAU, INFO )
         CALL CHKXER( 'cstzrqf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstzrqf( 1, 0, A, 1, TAU, INFO )
         CALL CHKXER( 'cstzrqf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstzrqf( 2, 2, A, 1, TAU, INFO )
         CALL CHKXER( 'cstzrqf', INFOT, NOUT, LERR, OK )
*
*        cstzrzf
*
         SRNAMT = 'cstzrzf'
         INFOT = 1
         CALL cstzrzf( -1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cstzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstzrzf( 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cstzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstzrzf( 2, 2, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cstzrzf', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cstzrzf( 2, 2, A, 2, TAU, W, 1, INFO )
         CALL CHKXER( 'cstzrzf', INFOT, NOUT, LERR, OK )
      END IF
*
*     Print a summary line.
*
      CALL ALAESM( PATH, OK, NOUT )
*
      RETURN
*
*     End of SERRTZ
*
      END
