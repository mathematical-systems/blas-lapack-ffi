      SUBROUTINE DERRVX(PATH,NUNIT)
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 31, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3 PATH
      INTEGER NUNIT
*     ..
*
*  Purpose
*  =======
*
*  DERRVX tests the error exits for the DOUBLE PRECISION driver routines
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
      INTEGER NMAX
      PARAMETER (NMAX=4)
*     ..
*     .. Local Scalars ..
      CHARACTER EQ
      CHARACTER*2 C2
      INTEGER I,INFO,J
      DOUBLE PRECISION RCOND
*     ..
*     .. Local Arrays ..
      INTEGER IP(NMAX),IW(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),AF(NMAX,NMAX),B(NMAX),C(NMAX),
     +                 R(NMAX),R1(NMAX),R2(NMAX),W(2*NMAX),X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL CHKXER,cdgbsv,cdgbsvX,cdgesv,cdgesvX,cdgtsv,cdgtsvX,
     +         cdpbsv,cdpbsvX,cdposv,cdposvX,cdppsv,cdppsvX,cdptsv,
     +         cdptsvX,cdspsv,cdspsvX,cdsysv,cdsysvX
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
          C(J) = 0.D0
          R(J) = 0.D0
          IP(J) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'GE')) THEN
*
*        cdgesv
*
          SRNAMT = 'cdgesv '
          INFOT = 1
          CALL cdgesv(-1,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgesv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgesv(0,-1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgesv ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgesv(2,1,A,1,IP,B,2,INFO)
          CALL CHKXER('cdgesv ',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgesv(2,1,A,2,IP,B,1,INFO)
          CALL CHKXER('cdgesv ',INFOT,NOUT,LERR,OK)
*
*        cdgesvX
*
          SRNAMT = 'cdgesvX'
          INFOT = 1
          CALL cdgesvX('/','N',0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgesvX('N','/',0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgesvX('N','N',-1,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgesvX('N','N',0,-1,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgesvX('N','N',2,1,A,1,AF,2,IP,EQ,R,C,B,2,X,2,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdgesvX('N','N',2,1,A,2,AF,1,IP,EQ,R,C,B,2,X,2,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 10
          EQ = '/'
          CALL cdgesvX('F','N',0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 11
          EQ = 'R'
          CALL cdgesvX('F','N',1,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 12
          EQ = 'C'
          CALL cdgesvX('F','N',1,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 14
          CALL cdgesvX('N','N',2,1,A,2,AF,2,IP,EQ,R,C,B,1,X,2,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
          INFOT = 16
          CALL cdgesvX('N','N',2,1,A,2,AF,2,IP,EQ,R,C,B,2,X,1,RCOND,R1,
     +                 R2,W,IW,INFO)
          CALL CHKXER('cdgesvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'GB')) THEN
*
*        cdgbsv
*
          SRNAMT = 'cdgbsv '
          INFOT = 1
          CALL cdgbsv(-1,0,0,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbsv(1,-1,0,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbsv(1,0,-1,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbsv(0,0,0,-1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbsv(1,1,1,0,A,3,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdgbsv(2,0,0,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdgbsv ',INFOT,NOUT,LERR,OK)
*
*        cdgbsvX
*
          SRNAMT = 'cdgbsvX'
          INFOT = 1
          CALL cdgbsvX('/','N',0,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgbsvX('N','/',0,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgbsvX('N','N',-1,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,
     +                 RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgbsvX('N','N',1,-1,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,
     +                 RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdgbsvX('N','N',1,0,-1,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,
     +                 RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdgbsvX('N','N',0,0,0,-1,A,1,AF,1,IP,EQ,R,C,B,1,X,1,
     +                 RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdgbsvX('N','N',1,1,1,0,A,2,AF,4,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdgbsvX('N','N',1,1,1,0,A,3,AF,3,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 12
          EQ = '/'
          CALL cdgbsvX('F','N',0,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 13
          EQ = 'R'
          CALL cdgbsvX('F','N',1,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 14
          EQ = 'C'
          CALL cdgbsvX('F','N',1,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 16
          CALL cdgbsvX('N','N',2,0,0,0,A,1,AF,1,IP,EQ,R,C,B,1,X,2,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 18
          CALL cdgbsvX('N','N',2,0,0,0,A,1,AF,1,IP,EQ,R,C,B,2,X,1,RCOND,
     +                 R1,R2,W,IW,INFO)
          CALL CHKXER('cdgbsvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'GT')) THEN
*
*        cdgtsv
*
          SRNAMT = 'cdgtsv '
          INFOT = 1
          CALL cdgtsv(-1,0,A(1,1),A(1,2),A(1,3),B,1,INFO)
          CALL CHKXER('cdgtsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgtsv(0,-1,A(1,1),A(1,2),A(1,3),B,1,INFO)
          CALL CHKXER('cdgtsv ',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdgtsv(2,0,A(1,1),A(1,2),A(1,3),B,1,INFO)
          CALL CHKXER('cdgtsv ',INFOT,NOUT,LERR,OK)
*
*        cdgtsvX
*
          SRNAMT = 'cdgtsvX'
          INFOT = 1
          CALL cdgtsvX('/','N',0,0,A(1,1),A(1,2),A(1,3),AF(1,1),AF(1,2),
     +                 AF(1,3),AF(1,4),IP,B,1,X,1,RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdgtsvX('N','/',0,0,A(1,1),A(1,2),A(1,3),AF(1,1),AF(1,2),
     +                 AF(1,3),AF(1,4),IP,B,1,X,1,RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdgtsvX('N','N',-1,0,A(1,1),A(1,2),A(1,3),AF(1,1),
     +                 AF(1,2),AF(1,3),AF(1,4),IP,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdgtsvX('N','N',0,-1,A(1,1),A(1,2),A(1,3),AF(1,1),
     +                 AF(1,2),AF(1,3),AF(1,4),IP,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
          INFOT = 14
          CALL cdgtsvX('N','N',2,0,A(1,1),A(1,2),A(1,3),AF(1,1),AF(1,2),
     +                 AF(1,3),AF(1,4),IP,B,1,X,2,RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
          INFOT = 16
          CALL cdgtsvX('N','N',2,0,A(1,1),A(1,2),A(1,3),AF(1,1),AF(1,2),
     +                 AF(1,3),AF(1,4),IP,B,2,X,1,RCOND,R1,R2,W,IW,INFO)
          CALL CHKXER('cdgtsvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PO')) THEN
*
*        cdposv
*
          SRNAMT = 'cdposv '
          INFOT = 1
          CALL cdposv('/',0,0,A,1,B,1,INFO)
          CALL CHKXER('cdposv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdposv('U',-1,0,A,1,B,1,INFO)
          CALL CHKXER('cdposv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdposv('U',0,-1,A,1,B,1,INFO)
          CALL CHKXER('cdposv ',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdposv('U',2,0,A,1,B,2,INFO)
          CALL CHKXER('cdposv ',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdposv('U',2,0,A,2,B,1,INFO)
          CALL CHKXER('cdposv ',INFOT,NOUT,LERR,OK)
*
*        cdposvX
*
          SRNAMT = 'cdposvX'
          INFOT = 1
          CALL cdposvX('/','U',0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdposvX('N','/',0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdposvX('N','U',-1,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdposvX('N','U',0,-1,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdposvX('N','U',2,0,A,1,AF,2,EQ,C,B,2,X,2,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdposvX('N','U',2,0,A,2,AF,1,EQ,C,B,2,X,2,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 9
          EQ = '/'
          CALL cdposvX('F','U',0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 10
          EQ = 'Y'
          CALL cdposvX('F','U',1,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdposvX('N','U',2,0,A,2,AF,2,EQ,C,B,1,X,2,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
          INFOT = 14
          CALL cdposvX('N','U',2,0,A,2,AF,2,EQ,C,B,2,X,1,RCOND,R1,R2,W,
     +                 IW,INFO)
          CALL CHKXER('cdposvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PP')) THEN
*
*        cdppsv
*
          SRNAMT = 'cdppsv '
          INFOT = 1
          CALL cdppsv('/',0,0,A,B,1,INFO)
          CALL CHKXER('cdppsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdppsv('U',-1,0,A,B,1,INFO)
          CALL CHKXER('cdppsv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdppsv('U',0,-1,A,B,1,INFO)
          CALL CHKXER('cdppsv ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdppsv('U',2,0,A,B,1,INFO)
          CALL CHKXER('cdppsv ',INFOT,NOUT,LERR,OK)
*
*        cdppsvX
*
          SRNAMT = 'cdppsvX'
          INFOT = 1
          CALL cdppsvX('/','U',0,0,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdppsvX('N','/',0,0,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdppsvX('N','U',-1,0,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdppsvX('N','U',0,-1,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 7
          EQ = '/'
          CALL cdppsvX('F','U',0,0,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 8
          EQ = 'Y'
          CALL cdppsvX('F','U',1,0,A,AF,EQ,C,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdppsvX('N','U',2,0,A,AF,EQ,C,B,1,X,2,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdppsvX('N','U',2,0,A,AF,EQ,C,B,2,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdppsvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PB')) THEN
*
*        cdpbsv
*
          SRNAMT = 'cdpbsv '
          INFOT = 1
          CALL cdpbsv('/',0,0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbsv('U',-1,0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbsv('U',1,-1,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpbsv('U',0,0,-1,A,1,B,1,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdpbsv('U',1,1,0,A,1,B,2,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdpbsv('U',2,0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbsv ',INFOT,NOUT,LERR,OK)
*
*        cdpbsvX
*
          SRNAMT = 'cdpbsvX'
          INFOT = 1
          CALL cdpbsvX('/','U',0,0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbsvX('N','/',0,0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbsvX('N','U',-1,0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpbsvX('N','U',1,-1,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpbsvX('N','U',0,0,-1,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdpbsvX('N','U',1,1,0,A,1,AF,2,EQ,C,B,2,X,2,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdpbsvX('N','U',1,1,0,A,2,AF,1,EQ,C,B,2,X,2,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 10
          EQ = '/'
          CALL cdpbsvX('F','U',0,0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 11
          EQ = 'Y'
          CALL cdpbsvX('F','U',1,0,0,A,1,AF,1,EQ,C,B,1,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 13
          CALL cdpbsvX('N','U',2,0,0,A,1,AF,1,EQ,C,B,1,X,2,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
          INFOT = 15
          CALL cdpbsvX('N','U',2,0,0,A,1,AF,1,EQ,C,B,2,X,1,RCOND,R1,R2,
     +                 W,IW,INFO)
          CALL CHKXER('cdpbsvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PT')) THEN
*
*        cdptsv
*
          SRNAMT = 'cdptsv '
          INFOT = 1
          CALL cdptsv(-1,0,A(1,1),A(1,2),B,1,INFO)
          CALL CHKXER('cdptsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdptsv(0,-1,A(1,1),A(1,2),B,1,INFO)
          CALL CHKXER('cdptsv ',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdptsv(2,0,A(1,1),A(1,2),B,1,INFO)
          CALL CHKXER('cdptsv ',INFOT,NOUT,LERR,OK)
*
*        cdptsvX
*
          SRNAMT = 'cdptsvX'
          INFOT = 1
          CALL cdptsvX('/',0,0,A(1,1),A(1,2),AF(1,1),AF(1,2),B,1,X,1,
     +                 RCOND,R1,R2,W,INFO)
          CALL CHKXER('cdptsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdptsvX('N',-1,0,A(1,1),A(1,2),AF(1,1),AF(1,2),B,1,X,1,
     +                 RCOND,R1,R2,W,INFO)
          CALL CHKXER('cdptsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdptsvX('N',0,-1,A(1,1),A(1,2),AF(1,1),AF(1,2),B,1,X,1,
     +                 RCOND,R1,R2,W,INFO)
          CALL CHKXER('cdptsvX',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdptsvX('N',2,0,A(1,1),A(1,2),AF(1,1),AF(1,2),B,1,X,2,
     +                 RCOND,R1,R2,W,INFO)
          CALL CHKXER('cdptsvX',INFOT,NOUT,LERR,OK)
          INFOT = 11
          CALL cdptsvX('N',2,0,A(1,1),A(1,2),AF(1,1),AF(1,2),B,2,X,1,
     +                 RCOND,R1,R2,W,INFO)
          CALL CHKXER('cdptsvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'SY')) THEN
*
*        cdsysv
*
          SRNAMT = 'cdsysv '
          INFOT = 1
          CALL cdsysv('/',0,0,A,1,IP,B,1,W,1,INFO)
          CALL CHKXER('cdsysv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsysv('U',-1,0,A,1,IP,B,1,W,1,INFO)
          CALL CHKXER('cdsysv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsysv('U',0,-1,A,1,IP,B,1,W,1,INFO)
          CALL CHKXER('cdsysv ',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdsysv('U',2,0,A,2,IP,B,1,W,1,INFO)
          CALL CHKXER('cdsysv ',INFOT,NOUT,LERR,OK)
*
*        cdsysvX
*
          SRNAMT = 'cdsysvX'
          INFOT = 1
          CALL cdsysvX('/','U',0,0,A,1,AF,1,IP,B,1,X,1,RCOND,R1,R2,W,1,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsysvX('N','/',0,0,A,1,AF,1,IP,B,1,X,1,RCOND,R1,R2,W,1,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsysvX('N','U',-1,0,A,1,AF,1,IP,B,1,X,1,RCOND,R1,R2,W,1,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdsysvX('N','U',0,-1,A,1,AF,1,IP,B,1,X,1,RCOND,R1,R2,W,1,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdsysvX('N','U',2,0,A,1,AF,2,IP,B,2,X,2,RCOND,R1,R2,W,4,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdsysvX('N','U',2,0,A,2,AF,1,IP,B,2,X,2,RCOND,R1,R2,W,4,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 11
          CALL cdsysvX('N','U',2,0,A,2,AF,2,IP,B,1,X,2,RCOND,R1,R2,W,4,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 13
          CALL cdsysvX('N','U',2,0,A,2,AF,2,IP,B,2,X,1,RCOND,R1,R2,W,4,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
          INFOT = 18
          CALL cdsysvX('N','U',2,0,A,2,AF,2,IP,B,2,X,2,RCOND,R1,R2,W,3,
     +                 IW,INFO)
          CALL CHKXER('cdsysvX',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'SP')) THEN
*
*        cdspsv
*
          SRNAMT = 'cdspsv '
          INFOT = 1
          CALL cdspsv('/',0,0,A,IP,B,1,INFO)
          CALL CHKXER('cdspsv ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdspsv('U',-1,0,A,IP,B,1,INFO)
          CALL CHKXER('cdspsv ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdspsv('U',0,-1,A,IP,B,1,INFO)
          CALL CHKXER('cdspsv ',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdspsv('U',2,0,A,IP,B,1,INFO)
          CALL CHKXER('cdspsv ',INFOT,NOUT,LERR,OK)
*
*        cdspsvX
*
          SRNAMT = 'cdspsvX'
          INFOT = 1
          CALL cdspsvX('/','U',0,0,A,AF,IP,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdspsvX('N','/',0,0,A,AF,IP,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdspsvX('N','U',-1,0,A,AF,IP,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdspsvX('N','U',0,-1,A,AF,IP,B,1,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdspsvX('N','U',2,0,A,AF,IP,B,1,X,2,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
          INFOT = 11
          CALL cdspsvX('N','U',2,0,A,AF,IP,B,2,X,1,RCOND,R1,R2,W,IW,
     +                 INFO)
          CALL CHKXER('cdspsvX',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      IF (OK) THEN
          WRITE (NOUT,FMT=9999) PATH
      ELSE
          WRITE (NOUT,FMT=9998) PATH
      END IF
*
 9999 FORMAT (1X,A3,' drivers passed the tests of the error exits')
 9998 FORMAT (' *** ',A3,' drivers failed the tests of the error ',
     +       'exits ***')
*
      RETURN
*
*     End of DERRVX
*
      END
