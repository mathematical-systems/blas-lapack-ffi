      SUBROUTINE DERRGE(PATH,NUNIT)
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
*  DERRGE tests the error exits for the DOUBLE PRECISION routines
*  for general matrices.
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
      INTEGER NMAX,LW
      PARAMETER (NMAX=4,LW=3*NMAX)
*     ..
*     .. Local Scalars ..
      CHARACTER*2 C2
      INTEGER I,INFO,J
      DOUBLE PRECISION ANRM,CCOND,RCOND
*     ..
*     .. Local Arrays ..
      INTEGER IP(NMAX),IW(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),AF(NMAX,NMAX),B(NMAX),R1(NMAX),
     +                 R2(NMAX),W(LW),X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdgbcon,cdgbequ,cdgbrfs,cdgbtf2,cdgbtrf,
     +         cdgbtrs,cdgecon,cdgeequ,cdgerfs,cdgetf2,cdgetrf,cdgetri,
     +         cdgetrs
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
*     .. Intrinsic Functions ..
      INTRINSIC DBLE
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE (NOUT,FMT=*)
      C2 = PATH(2:3)
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1,NMAX
          DO 10 I = 1,NMAX
              A(I,J) = 1.D0/DBLE(I+J)
              AF(I,J) = 1.D0/DBLE(I+J)
   10     CONTINUE
          B(J) = 0.D0
          R1(J) = 0.D0
          R2(J) = 0.D0
          W(J) = 0.D0
          X(J) = 0.D0
          IP(J) = J
          IW(J) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'GE')) THEN
*
*        Test error exits of the routines that use the LU decomposition
*        of a general matrix.
*
*        cdgetrf
*
          SRNAMT = 'cdgetrf'
          INFOT = 1
          CALL cdgetrf(-1,0,A,1,IP,INFO)
          CALL CHKXER('cdgetrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgetrf(0,-1,A,1,IP,INFO)
          CALL CHKXER('cdgetrf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgetrf(2,1,A,1,IP,INFO)
          CALL CHKXER('cdgetrf',INFOT,NOUT,LERR,OK)
*
*        cdgetf2
*
          SRNAMT = 'cdgetf2'
          INFOT = 1
          CALL cdgetf2(-1,0,A,1,IP,INFO)
          CALL CHKXER('cdgetf2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgetf2(0,-1,A,1,IP,INFO)
          CALL CHKXER('cdgetf2',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgetf2(2,1,A,1,IP,INFO)
          CALL CHKXER('cdgetf2',INFOT,NOUT,LERR,OK)
*
*        cdgetri
*
          SRNAMT = 'cdgetri'
          INFOT = 1
          CALL cdgetri(-1,A,1,IP,W,LW,INFO)
          CALL CHKXER('cdgetri',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgetri(2,A,1,IP,W,LW,INFO)
          CALL CHKXER('cdgetri',INFOT,NOUT,LERR,OK)
*
*        cdgetrs
*
          SRNAMT = 'cdgetrs'
          INFOT = 1
          CALL cdgetrs('/',0,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgetrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgetrs('N',-1,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgetrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgetrs('N',0,-1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgetrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgetrs('N',2,1,A,1,IP,B,2,INFO)
          CALL CHKXER('cdgetrs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdgetrs('N',2,1,A,2,IP,B,1,INFO)
          CALL CHKXER('cdgetrs',INFOT,NOUT,LERR,OK)
*
*        cdgerfs
*
          SRNAMT = 'cdgerfs'
          INFOT = 1
          CALL cdgerfs('/',0,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgerfs('N',-1,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgerfs('N',0,-1,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgerfs('N',2,1,A,1,AF,2,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgerfs('N',2,1,A,2,AF,1,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdgerfs('N',2,1,A,2,AF,2,IP,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdgerfs('N',2,1,A,2,AF,2,IP,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgerfs',INFOT,NOUT,LERR,OK)
*
*        cdgecon
*
          SRNAMT = 'cdgecon'
          INFOT = 1
          CALL cdgecon('/',0,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgecon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgecon('1',-1,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgecon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgecon('1',2,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgecon',INFOT,NOUT,LERR,OK)
*
*        cdgeequ
*
          SRNAMT = 'cdgeequ'
          INFOT = 1
          CALL cdgeequ(-1,0,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgeequ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgeequ(0,-1,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgeequ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgeequ(2,2,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgeequ',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'GB')) THEN
*
*        Test error exits of the routines that use the LU decomposition
*        of a general band matrix.
*
*        cdgbtrf
*
          SRNAMT = 'cdgbtrf'
          INFOT = 1
          CALL cdgbtrf(-1,0,0,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbtrf(0,-1,0,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbtrf(1,1,-1,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbtrf(1,1,0,-1,A,1,IP,INFO)
          CALL CHKXER('cdgbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbtrf(2,2,1,1,A,3,IP,INFO)
          CALL CHKXER('cdgbtrf',INFOT,NOUT,LERR,OK)
*
*        cdgbtf2
*
          SRNAMT = 'cdgbtf2'
          INFOT = 1
          CALL cdgbtf2(-1,0,0,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbtf2(0,-1,0,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbtf2(1,1,-1,0,A,1,IP,INFO)
          CALL CHKXER('cdgbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbtf2(1,1,0,-1,A,1,IP,INFO)
          CALL CHKXER('cdgbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbtf2(2,2,1,1,A,3,IP,INFO)
          CALL CHKXER('cdgbtf2',INFOT,NOUT,LERR,OK)
*
*        cdgbtrs
*
          SRNAMT = 'cdgbtrs'
          INFOT = 1
          CALL cdgbtrs('/',0,0,0,1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbtrs('N',-1,0,0,1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbtrs('N',1,-1,0,1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbtrs('N',1,0,-1,1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgbtrs('N',1,0,0,-1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgbtrs('N',2,1,1,1,A,3,IP,B,2,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdgbtrs('N',2,0,0,1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbtrs',INFOT,NOUT,LERR,OK)
*
*        cdgbrfs
*
          SRNAMT = 'cdgbrfs'
          INFOT = 1
          CALL cdgbrfs('/',0,0,0,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbrfs('N',-1,0,0,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbrfs('N',1,-1,0,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbrfs('N',1,0,-1,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgbrfs('N',1,0,0,-1,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgbrfs('N',2,1,1,1,A,2,AF,4,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdgbrfs('N',2,1,1,1,A,3,AF,3,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdgbrfs('N',2,0,0,1,A,1,AF,1,IP,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 14
          CALL cdgbrfs('N',2,0,0,1,A,1,AF,1,IP,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbrfs',INFOT,NOUT,LERR,OK)
*
*        cdgbcon
*
          SRNAMT = 'cdgbcon'
          INFOT = 1
          CALL cdgbcon('/',0,0,0,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgbcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbcon('1',-1,0,0,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgbcon',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbcon('1',1,-1,0,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgbcon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbcon('1',1,0,-1,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgbcon',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbcon('1',2,1,1,A,3,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgbcon',INFOT,NOUT,LERR,OK)
*
*        cdgbequ
*
          SRNAMT = 'cdgbequ'
          INFOT = 1
          CALL cdgbequ(-1,0,0,0,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgbequ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbequ(0,-1,0,0,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgbequ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbequ(1,1,-1,0,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgbequ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbequ(1,1,0,-1,A,1,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgbequ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbequ(2,2,1,1,A,2,R1,R2,RCOND,CCOND,ANRM,INFO)
          CALL CHKXER('cdgbequ',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRGE
*
      END
