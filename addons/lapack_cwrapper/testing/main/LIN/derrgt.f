      SUBROUTINE DERRGT(PATH,NUNIT)
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
*  DERRGT tests the error exits for the DOUBLE PRECISION tridiagonal
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
      DOUBLE PRECISION ANORM,RCOND
*     ..
*     .. Local Arrays ..
      INTEGER IP(NMAX),IW(NMAX)
      DOUBLE PRECISION B(NMAX),C(NMAX),CF(NMAX),D(NMAX),DF(NMAX),
     +                 E(NMAX),EF(NMAX),F(NMAX),R1(NMAX),R2(NMAX),
     +                 W(NMAX),X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdgtcon,cdgtrfs,cdgttrf,cdgttrs,cdptcon,
     +         cdptrfs,cdpttrf,cdpttrs
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
      D(1) = 1.D0
      D(2) = 2.D0
      DF(1) = 1.D0
      DF(2) = 2.D0
      E(1) = 3.D0
      E(2) = 4.D0
      EF(1) = 3.D0
      EF(2) = 4.D0
      ANORM = 1.0D0
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'GT')) THEN
*
*        Test error exits for the general tridiagonal routines.
*
*        cdgttrf
*
          SRNAMT = 'cdgttrf'
          INFOT = 1
          CALL cdgttrf(-1,C,D,E,F,IP,INFO)
          CALL CHKXER('cdgttrf',INFOT,NOUT,LERR,OK)
*
*        cdgttrs
*
          SRNAMT = 'cdgttrs'
          INFOT = 1
          CALL cdgttrs('/',0,0,C,D,E,F,IP,X,1,INFO)
          CALL CHKXER('cdgttrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgttrs('N',-1,0,C,D,E,F,IP,X,1,INFO)
          CALL CHKXER('cdgttrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgttrs('N',0,-1,C,D,E,F,IP,X,1,INFO)
          CALL CHKXER('cdgttrs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdgttrs('N',2,1,C,D,E,F,IP,X,1,INFO)
          CALL CHKXER('cdgttrs',INFOT,NOUT,LERR,OK)
*
*        cdgtrfs
*
          SRNAMT = 'cdgtrfs'
          INFOT = 1
          CALL cdgtrfs('/',0,0,C,D,E,CF,DF,EF,F,IP,B,1,X,1,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdgtrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgtrfs('N',-1,0,C,D,E,CF,DF,EF,F,IP,B,1,X,1,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdgtrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgtrfs('N',0,-1,C,D,E,CF,DF,EF,F,IP,B,1,X,1,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdgtrfs',INFOT,NOUT,LERR,OK)
          INFOT = 13
          CALL cdgtrfs('N',2,1,C,D,E,CF,DF,EF,F,IP,B,1,X,2,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdgtrfs',INFOT,NOUT,LERR,OK)
          INFOT = 15
          CALL cdgtrfs('N',2,1,C,D,E,CF,DF,EF,F,IP,B,2,X,1,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdgtrfs',INFOT,NOUT,LERR,OK)
*
*        cdgtcon
*
          SRNAMT = 'cdgtcon'
          INFOT = 1
          CALL cdgtcon('/',0,C,D,E,F,IP,ANORM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgtcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgtcon('I',-1,C,D,E,F,IP,ANORM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgtcon',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdgtcon('I',0,C,D,E,F,IP,-ANORM,RCOND,W,IW,INFO)
          CALL CHKXER('cdgtcon',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PT')) THEN
*
*        Test error exits for the positive definite tridiagonal
*        routines.
*
*        cdpttrf
*
          SRNAMT = 'cdpttrf'
          INFOT = 1
          CALL cdpttrf(-1,D,E,INFO)
          CALL CHKXER('cdpttrf',INFOT,NOUT,LERR,OK)
*
*        cdpttrs
*
          SRNAMT = 'cdpttrs'
          INFOT = 1
          CALL cdpttrs(-1,0,D,E,X,1,INFO)
          CALL CHKXER('cdpttrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpttrs(0,-1,D,E,X,1,INFO)
          CALL CHKXER('cdpttrs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdpttrs(2,1,D,E,X,1,INFO)
          CALL CHKXER('cdpttrs',INFOT,NOUT,LERR,OK)
*
*        cdptrfs
*
          SRNAMT = 'cdptrfs'
          INFOT = 1
          CALL cdptrfs(-1,0,D,E,DF,EF,B,1,X,1,R1,R2,W,INFO)
          CALL CHKXER('cdptrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdptrfs(0,-1,D,E,DF,EF,B,1,X,1,R1,R2,W,INFO)
          CALL CHKXER('cdptrfs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdptrfs(2,1,D,E,DF,EF,B,1,X,2,R1,R2,W,INFO)
          CALL CHKXER('cdptrfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdptrfs(2,1,D,E,DF,EF,B,2,X,1,R1,R2,W,INFO)
          CALL CHKXER('cdptrfs',INFOT,NOUT,LERR,OK)
*
*        cdptcon
*
          SRNAMT = 'cdptcon'
          INFOT = 1
          CALL cdptcon(-1,D,E,ANORM,RCOND,W,INFO)
          CALL CHKXER('cdptcon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdptcon(0,D,E,-ANORM,RCOND,W,INFO)
          CALL CHKXER('cdptcon',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRGT
*
      END
