      SUBROUTINE DERRTZ(PATH,NUNIT)
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      CHARACTER*3 PATH
      INTEGER NUNIT
*     ..
*
*  Purpose
*  =======
*
*  DERRTZ tests the error exits for cdtzrqf and cstzrzf.
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
      INTEGER NMAX
      PARAMETER (NMAX=2)
*     ..
*     .. Local Scalars ..
      CHARACTER*2 C2
      INTEGER INFO
*     ..
*     .. Local Arrays ..
      DOUBLE PRECISION A(NMAX,NMAX),TAU(NMAX),W(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdtzrqf,cdtzrzf
*     ..
*     .. Scalars in Common ..
      LOGICAL LERR,OK
      CHARACTER*7 SRNAMT
      INTEGER INFOT,NOUT
*     ..
*     .. Common blocks ..
      COMMON /INFOC/INFOT,NOUT,OK,LERR
      COMMON /SRNAMC/SRNAMT
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE (NOUT,FMT=*)
      C2 = PATH(2:3)
      A(1,1) = 1.D+0
      A(1,2) = 2.D+0
      A(2,2) = 3.D+0
      A(2,1) = 4.D+0
      W(1) = 0.0D+0
      W(2) = 0.0D+0
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'TZ')) THEN
*
*        Test error exits for the trapezoidal routines.
*
*        cdtzrqf
*
          SRNAMT = 'cdtzrqf'
          INFOT = 1
          CALL cdtzrqf(-1,0,A,1,TAU,INFO)
          CALL CHKXER('cdtzrqf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtzrqf(1,0,A,1,TAU,INFO)
          CALL CHKXER('cdtzrqf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtzrqf(2,2,A,1,TAU,INFO)
          CALL CHKXER('cdtzrqf',INFOT,NOUT,LERR,OK)
*
*        cdtzrzf
*
          SRNAMT = 'cdtzrzf'
          INFOT = 1
          CALL cdtzrzf(-1,0,A,1,TAU,W,1,INFO)
          CALL CHKXER('cdtzrzf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtzrzf(1,0,A,1,TAU,W,1,INFO)
          CALL CHKXER('cdtzrzf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtzrzf(2,2,A,1,TAU,W,1,INFO)
          CALL CHKXER('cdtzrzf',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdtzrzf(2,2,A,2,TAU,W,1,INFO)
          CALL CHKXER('cdtzrzf',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRTZ
*
      END
