      SUBROUTINE DERRLS(PATH,NUNIT)
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
*  DERRLS tests the error exits for the DOUBLE PRECISION least squares
*  driver routines (cdgels, csgelsS, csgelsX, csgelsY, csgelsD).
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
      INTEGER INFO,IRNK
      DOUBLE PRECISION RCOND
*     ..
*     .. Local Arrays ..
      INTEGER IP(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),B(NMAX,NMAX),S(NMAX),W(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdgels,cdgelsD,cdgelsS,cdgelsX,cdgelsY
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
      A(1,1) = 1.0D+0
      A(1,2) = 2.0D+0
      A(2,2) = 3.0D+0
      A(2,1) = 4.0D+0
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'LS')) THEN
*
*        Test error exits for the least squares driver routines.
*
*        cdgels
*
          SRNAMT = 'cdgels '
          INFOT = 1
          CALL cdgels('/',0,0,0,A,1,B,1,W,1,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgels('N',-1,0,0,A,1,B,1,W,1,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgels('N',0,-1,0,A,1,B,1,W,1,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgels('N',0,0,-1,A,1,B,1,W,1,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgels('N',2,0,0,A,1,B,2,W,2,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdgels('N',2,0,0,A,2,B,1,W,2,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdgels('N',1,1,0,A,1,B,1,W,1,INFO)
          CALL CHKXER('cdgels ',INFOT,NOUT,LERR,OK)
*
*        cdgelsS
*
          SRNAMT = 'cdgelsS'
          INFOT = 1
          CALL cdgelsS(-1,0,0,A,1,B,1,S,RCOND,IRNK,W,1,INFO)
          CALL CHKXER('cdgelsS',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgelsS(0,-1,0,A,1,B,1,S,RCOND,IRNK,W,1,INFO)
          CALL CHKXER('cdgelsS',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgelsS(0,0,-1,A,1,B,1,S,RCOND,IRNK,W,1,INFO)
          CALL CHKXER('cdgelsS',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgelsS(2,0,0,A,1,B,2,S,RCOND,IRNK,W,2,INFO)
          CALL CHKXER('cdgelsS',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgelsS(2,0,0,A,2,B,1,S,RCOND,IRNK,W,2,INFO)
          CALL CHKXER('cdgelsS',INFOT,NOUT,LERR,OK)
*
*        cdgelsX
*
          SRNAMT = 'cdgelsX'
          INFOT = 1
          CALL cdgelsX(-1,0,0,A,1,B,1,IP,RCOND,IRNK,W,INFO)
          CALL CHKXER('cdgelsX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgelsX(0,-1,0,A,1,B,1,IP,RCOND,IRNK,W,INFO)
          CALL CHKXER('cdgelsX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgelsX(0,0,-1,A,1,B,1,IP,RCOND,IRNK,W,INFO)
          CALL CHKXER('cdgelsX',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgelsX(2,0,0,A,1,B,2,IP,RCOND,IRNK,W,INFO)
          CALL CHKXER('cdgelsX',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgelsX(2,0,0,A,2,B,1,IP,RCOND,IRNK,W,INFO)
          CALL CHKXER('cdgelsX',INFOT,NOUT,LERR,OK)
*
*        cdgelsY
*
          SRNAMT = 'cdgelsY'
          INFOT = 1
          CALL cdgelsY(-1,0,0,A,1,B,1,IP,RCOND,IRNK,W,10,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgelsY(0,-1,0,A,1,B,1,IP,RCOND,IRNK,W,10,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgelsY(0,0,-1,A,1,B,1,IP,RCOND,IRNK,W,10,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgelsY(2,0,0,A,1,B,2,IP,RCOND,IRNK,W,10,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgelsY(2,0,0,A,2,B,1,IP,RCOND,IRNK,W,10,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdgelsY(2,2,1,A,2,B,2,IP,RCOND,IRNK,W,1,INFO)
          CALL CHKXER('cdgelsY',INFOT,NOUT,LERR,OK)
*
*        cdgelsD
*
          SRNAMT = 'cdgelsD'
          INFOT = 1
          CALL cdgelsD(-1,0,0,A,1,B,1,S,RCOND,IRNK,W,10,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgelsD(0,-1,0,A,1,B,1,S,RCOND,IRNK,W,10,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgelsD(0,0,-1,A,1,B,1,S,RCOND,IRNK,W,10,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgelsD(2,0,0,A,1,B,2,S,RCOND,IRNK,W,10,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgelsD(2,0,0,A,2,B,1,S,RCOND,IRNK,W,10,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdgelsD(2,2,1,A,2,B,2,S,RCOND,IRNK,W,1,IP,INFO)
          CALL CHKXER('cdgelsD',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRLS
*
      END
