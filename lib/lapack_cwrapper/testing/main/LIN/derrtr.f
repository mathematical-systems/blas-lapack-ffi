      SUBROUTINE DERRTR(PATH,NUNIT)
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3 PATH
      INTEGER NUNIT
*     ..
*
*  Purpose
*  =======
*
*  DERRTR tests the error exits for the DOUBLE PRECISION triangular
*  routines.
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
      DOUBLE PRECISION RCOND,SCALE
*     ..
*     .. Local Arrays ..
      INTEGER IW(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),B(NMAX),R1(NMAX),R2(NMAX),W(NMAX),
     +                 X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdlatbs,cdlatps,cdlatrs,cdtbcon,cdtbrfs,
     +         cdtbtrs,cdtpcon,cdtprfs,cdtptri,cdtptrs,cdtrcon,cdtrrfs,
     +         cdtrti2,cdtrtri,cdtrtrs
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
      A(1,1) = 1.D0
      A(1,2) = 2.D0
      A(2,2) = 3.D0
      A(2,1) = 4.D0
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'TR')) THEN
*
*        Test error exits for the general triangular routines.
*
*        cdtrtri
*
          SRNAMT = 'cdtrtri'
          INFOT = 1
          CALL cdtrtri('/','N',0,A,1,INFO)
          CALL CHKXER('cdtrtri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtrtri('U','/',0,A,1,INFO)
          CALL CHKXER('cdtrtri',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtrtri('U','N',-1,A,1,INFO)
          CALL CHKXER('cdtrtri',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtrtri('U','N',2,A,1,INFO)
          CALL CHKXER('cdtrtri',INFOT,NOUT,LERR,OK)
*
*        cdtrti2
*
          SRNAMT = 'cdtrti2'
          INFOT = 1
          CALL cdtrti2('/','N',0,A,1,INFO)
          CALL CHKXER('cdtrti2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtrti2('U','/',0,A,1,INFO)
          CALL CHKXER('cdtrti2',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtrti2('U','N',-1,A,1,INFO)
          CALL CHKXER('cdtrti2',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtrti2('U','N',2,A,1,INFO)
          CALL CHKXER('cdtrti2',INFOT,NOUT,LERR,OK)
*
*        cdtrtrs
*
          SRNAMT = 'cdtrtrs'
          INFOT = 1
          CALL cdtrtrs('/','N','N',0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtrtrs('U','/','N',0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtrtrs('U','N','/',0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtrtrs('U','N','N',-1,0,A,1,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtrtrs('U','N','N',0,-1,A,1,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdtrtrs('U','N','N',2,1,A,1,X,2,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdtrtrs('U','N','N',2,1,A,2,X,1,INFO)
          CALL CHKXER('cdtrtrs',INFOT,NOUT,LERR,OK)
*
*        cdtrrfs
*
          SRNAMT = 'cdtrrfs'
          INFOT = 1
          CALL cdtrrfs('/','N','N',0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtrrfs('U','/','N',0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtrrfs('U','N','/',0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtrrfs('U','N','N',-1,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtrrfs('U','N','N',0,-1,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdtrrfs('U','N','N',2,1,A,1,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdtrrfs('U','N','N',2,1,A,2,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
          INFOT = 11
          CALL cdtrrfs('U','N','N',2,1,A,2,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtrrfs',INFOT,NOUT,LERR,OK)
*
*        cdtrcon
*
          SRNAMT = 'cdtrcon'
          INFOT = 1
          CALL cdtrcon('/','U','N',0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtrcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtrcon('1','/','N',0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtrcon',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtrcon('1','U','/',0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtrcon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtrcon('1','U','N',-1,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtrcon',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdtrcon('1','U','N',2,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtrcon',INFOT,NOUT,LERR,OK)
*
*        cdlatrs
*
          SRNAMT = 'cdlatrs'
          INFOT = 1
          CALL cdlatrs('/','N','N','N',0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdlatrs('U','/','N','N',0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdlatrs('U','N','/','N',0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdlatrs('U','N','N','/',0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdlatrs('U','N','N','N',-1,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdlatrs('U','N','N','N',2,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatrs',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'TP')) THEN
*
*        Test error exits for the packed triangular routines.
*
*        cdtptri
*
          SRNAMT = 'cdtptri'
          INFOT = 1
          CALL cdtptri('/','N',0,A,INFO)
          CALL CHKXER('cdtptri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtptri('U','/',0,A,INFO)
          CALL CHKXER('cdtptri',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtptri('U','N',-1,A,INFO)
          CALL CHKXER('cdtptri',INFOT,NOUT,LERR,OK)
*
*        cdtptrs
*
          SRNAMT = 'cdtptrs'
          INFOT = 1
          CALL cdtptrs('/','N','N',0,0,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtptrs('U','/','N',0,0,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtptrs('U','N','/',0,0,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtptrs('U','N','N',-1,0,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtptrs('U','N','N',0,-1,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdtptrs('U','N','N',2,1,A,X,1,INFO)
          CALL CHKXER('cdtptrs',INFOT,NOUT,LERR,OK)
*
*        cdtprfs
*
          SRNAMT = 'cdtprfs'
          INFOT = 1
          CALL cdtprfs('/','N','N',0,0,A,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtprfs('U','/','N',0,0,A,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtprfs('U','N','/',0,0,A,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtprfs('U','N','N',-1,0,A,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtprfs('U','N','N',0,-1,A,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdtprfs('U','N','N',2,1,A,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdtprfs('U','N','N',2,1,A,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtprfs',INFOT,NOUT,LERR,OK)
*
*        cdtpcon
*
          SRNAMT = 'cdtpcon'
          INFOT = 1
          CALL cdtpcon('/','U','N',0,A,RCOND,W,IW,INFO)
          CALL CHKXER('cdtpcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtpcon('1','/','N',0,A,RCOND,W,IW,INFO)
          CALL CHKXER('cdtpcon',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtpcon('1','U','/',0,A,RCOND,W,IW,INFO)
          CALL CHKXER('cdtpcon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtpcon('1','U','N',-1,A,RCOND,W,IW,INFO)
          CALL CHKXER('cdtpcon',INFOT,NOUT,LERR,OK)
*
*        cdlatps
*
          SRNAMT = 'cdlatps'
          INFOT = 1
          CALL cdlatps('/','N','N','N',0,A,X,SCALE,W,INFO)
          CALL CHKXER('cdlatps',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdlatps('U','/','N','N',0,A,X,SCALE,W,INFO)
          CALL CHKXER('cdlatps',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdlatps('U','N','/','N',0,A,X,SCALE,W,INFO)
          CALL CHKXER('cdlatps',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdlatps('U','N','N','/',0,A,X,SCALE,W,INFO)
          CALL CHKXER('cdlatps',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdlatps('U','N','N','N',-1,A,X,SCALE,W,INFO)
          CALL CHKXER('cdlatps',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'TB')) THEN
*
*        Test error exits for the banded triangular routines.
*
*        cdtbtrs
*
          SRNAMT = 'cdtbtrs'
          INFOT = 1
          CALL cdtbtrs('/','N','N',0,0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtbtrs('U','/','N',0,0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtbtrs('U','N','/',0,0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtbtrs('U','N','N',-1,0,0,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtbtrs('U','N','N',0,-1,0,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdtbtrs('U','N','N',0,0,-1,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdtbtrs('U','N','N',2,1,1,A,1,X,2,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdtbtrs('U','N','N',2,0,1,A,1,X,1,INFO)
          CALL CHKXER('cdtbtrs',INFOT,NOUT,LERR,OK)
*
*        cdtbrfs
*
          SRNAMT = 'cdtbrfs'
          INFOT = 1
          CALL cdtbrfs('/','N','N',0,0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtbrfs('U','/','N',0,0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtbrfs('U','N','/',0,0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtbrfs('U','N','N',-1,0,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtbrfs('U','N','N',0,-1,0,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdtbrfs('U','N','N',0,0,-1,A,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdtbrfs('U','N','N',2,1,1,A,1,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdtbrfs('U','N','N',2,1,1,A,2,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdtbrfs('U','N','N',2,1,1,A,2,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdtbrfs',INFOT,NOUT,LERR,OK)
*
*        cdtbcon
*
          SRNAMT = 'cdtbcon'
          INFOT = 1
          CALL cdtbcon('/','U','N',0,0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdtbcon('1','/','N',0,0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdtbcon('1','U','/',0,0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdtbcon('1','U','N',-1,0,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdtbcon('1','U','N',0,-1,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdtbcon('1','U','N',2,1,A,1,RCOND,W,IW,INFO)
          CALL CHKXER('cdtbcon',INFOT,NOUT,LERR,OK)
*
*        cdlatbs
*
          SRNAMT = 'cdlatbs'
          INFOT = 1
          CALL cdlatbs('/','N','N','N',0,0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdlatbs('U','/','N','N',0,0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdlatbs('U','N','/','N',0,0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdlatbs('U','N','N','/',0,0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdlatbs('U','N','N','N',-1,0,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdlatbs('U','N','N','N',1,-1,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdlatbs('U','N','N','N',2,1,A,1,X,SCALE,W,INFO)
          CALL CHKXER('cdlatbs',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRTR
*
      END
