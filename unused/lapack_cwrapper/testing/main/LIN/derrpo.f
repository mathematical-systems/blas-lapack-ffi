      SUBROUTINE DERRPO(PATH,NUNIT)
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
*  DERRPO tests the error exits for the DOUBLE PRECISION routines
*  for symmetric positive definite matrices.
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
      CHARACTER*2 C2
      INTEGER I,INFO,J
      DOUBLE PRECISION ANRM,RCOND
*     ..
*     .. Local Arrays ..
      INTEGER IW(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),AF(NMAX,NMAX),B(NMAX),R1(NMAX),
     +                 R2(NMAX),W(3*NMAX),X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdpbcon,cdpbequ,cdpbrfs,cdpbtf2,cdpbtrf,
     +         cdpbtrs,cdpocon,cdpoequ,cdporfs,cdpotf2,cdpotrf,cdpotri,
     +         cdpotrs,cdppcon,cdppequ,cdpprfs,cdpptrf,cdpptri,cdpptrs
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
          IW(J) = J
   20 CONTINUE
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'PO')) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite matrix.
*
*        cdpotrf
*
          SRNAMT = 'cdpotrf'
          INFOT = 1
          CALL cdpotrf('/',0,A,1,INFO)
          CALL CHKXER('cdpotrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpotrf('U',-1,A,1,INFO)
          CALL CHKXER('cdpotrf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpotrf('U',2,A,1,INFO)
          CALL CHKXER('cdpotrf',INFOT,NOUT,LERR,OK)
*
*        cdpotf2
*
          SRNAMT = 'cdpotf2'
          INFOT = 1
          CALL cdpotf2('/',0,A,1,INFO)
          CALL CHKXER('cdpotf2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpotf2('U',-1,A,1,INFO)
          CALL CHKXER('cdpotf2',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpotf2('U',2,A,1,INFO)
          CALL CHKXER('cdpotf2',INFOT,NOUT,LERR,OK)
*
*        cdpotri
*
          SRNAMT = 'cdpotri'
          INFOT = 1
          CALL cdpotri('/',0,A,1,INFO)
          CALL CHKXER('cdpotri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpotri('U',-1,A,1,INFO)
          CALL CHKXER('cdpotri',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpotri('U',2,A,1,INFO)
          CALL CHKXER('cdpotri',INFOT,NOUT,LERR,OK)
*
*        cdpotrs
*
          SRNAMT = 'cdpotrs'
          INFOT = 1
          CALL cdpotrs('/',0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpotrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpotrs('U',-1,0,A,1,B,1,INFO)
          CALL CHKXER('cdpotrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpotrs('U',0,-1,A,1,B,1,INFO)
          CALL CHKXER('cdpotrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpotrs('U',2,1,A,1,B,2,INFO)
          CALL CHKXER('cdpotrs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdpotrs('U',2,1,A,2,B,1,INFO)
          CALL CHKXER('cdpotrs',INFOT,NOUT,LERR,OK)
*
*        cdporfs
*
          SRNAMT = 'cdporfs'
          INFOT = 1
          CALL cdporfs('/',0,0,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdporfs('U',-1,0,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdporfs('U',0,-1,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdporfs('U',2,1,A,1,AF,2,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdporfs('U',2,1,A,2,AF,1,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdporfs('U',2,1,A,2,AF,2,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
          INFOT = 11
          CALL cdporfs('U',2,1,A,2,AF,2,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdporfs',INFOT,NOUT,LERR,OK)
*
*        cdpocon
*
          SRNAMT = 'cdpocon'
          INFOT = 1
          CALL cdpocon('/',0,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpocon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpocon('U',-1,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpocon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpocon('U',2,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpocon',INFOT,NOUT,LERR,OK)
*
*        cdpoequ
*
          SRNAMT = 'cdpoequ'
          INFOT = 1
          CALL cdpoequ(-1,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpoequ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpoequ(2,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpoequ',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PP')) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite packed matrix.
*
*        cdpptrf
*
          SRNAMT = 'cdpptrf'
          INFOT = 1
          CALL cdpptrf('/',0,A,INFO)
          CALL CHKXER('cdpptrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpptrf('U',-1,A,INFO)
          CALL CHKXER('cdpptrf',INFOT,NOUT,LERR,OK)
*
*        cdpptri
*
          SRNAMT = 'cdpptri'
          INFOT = 1
          CALL cdpptri('/',0,A,INFO)
          CALL CHKXER('cdpptri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpptri('U',-1,A,INFO)
          CALL CHKXER('cdpptri',INFOT,NOUT,LERR,OK)
*
*        cdpptrs
*
          SRNAMT = 'cdpptrs'
          INFOT = 1
          CALL cdpptrs('/',0,0,A,B,1,INFO)
          CALL CHKXER('cdpptrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpptrs('U',-1,0,A,B,1,INFO)
          CALL CHKXER('cdpptrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpptrs('U',0,-1,A,B,1,INFO)
          CALL CHKXER('cdpptrs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdpptrs('U',2,1,A,B,1,INFO)
          CALL CHKXER('cdpptrs',INFOT,NOUT,LERR,OK)
*
*        cdpprfs
*
          SRNAMT = 'cdpprfs'
          INFOT = 1
          CALL cdpprfs('/',0,0,A,AF,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpprfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpprfs('U',-1,0,A,AF,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpprfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpprfs('U',0,-1,A,AF,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpprfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdpprfs('U',2,1,A,AF,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpprfs',INFOT,NOUT,LERR,OK)
          INFOT = 9
          CALL cdpprfs('U',2,1,A,AF,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpprfs',INFOT,NOUT,LERR,OK)
*
*        cdppcon
*
          SRNAMT = 'cdppcon'
          INFOT = 1
          CALL cdppcon('/',0,A,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdppcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdppcon('U',-1,A,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdppcon',INFOT,NOUT,LERR,OK)
*
*        cdppequ
*
          SRNAMT = 'cdppequ'
          INFOT = 1
          CALL cdppequ('/',0,A,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdppequ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdppequ('U',-1,A,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdppequ',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'PB')) THEN
*
*        Test error exits of the routines that use the Cholesky
*        decomposition of a symmetric positive definite band matrix.
*
*        cdpbtrf
*
          SRNAMT = 'cdpbtrf'
          INFOT = 1
          CALL cdpbtrf('/',0,0,A,1,INFO)
          CALL CHKXER('cdpbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbtrf('U',-1,0,A,1,INFO)
          CALL CHKXER('cdpbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbtrf('U',1,-1,A,1,INFO)
          CALL CHKXER('cdpbtrf',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpbtrf('U',2,1,A,1,INFO)
          CALL CHKXER('cdpbtrf',INFOT,NOUT,LERR,OK)
*
*        cdpbtf2
*
          SRNAMT = 'cdpbtf2'
          INFOT = 1
          CALL cdpbtf2('/',0,0,A,1,INFO)
          CALL CHKXER('cdpbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbtf2('U',-1,0,A,1,INFO)
          CALL CHKXER('cdpbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbtf2('U',1,-1,A,1,INFO)
          CALL CHKXER('cdpbtf2',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpbtf2('U',2,1,A,1,INFO)
          CALL CHKXER('cdpbtf2',INFOT,NOUT,LERR,OK)
*
*        cdpbtrs
*
          SRNAMT = 'cdpbtrs'
          INFOT = 1
          CALL cdpbtrs('/',0,0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbtrs('U',-1,0,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbtrs('U',1,-1,0,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpbtrs('U',0,0,-1,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdpbtrs('U',2,1,1,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdpbtrs('U',2,0,1,A,1,B,1,INFO)
          CALL CHKXER('cdpbtrs',INFOT,NOUT,LERR,OK)
*
*        cdpbrfs
*
          SRNAMT = 'cdpbrfs'
          INFOT = 1
          CALL cdpbrfs('/',0,0,0,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbrfs('U',-1,0,0,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbrfs('U',1,-1,0,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdpbrfs('U',0,0,-1,A,1,AF,1,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdpbrfs('U',2,1,1,A,1,AF,2,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdpbrfs('U',2,1,1,A,2,AF,1,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdpbrfs('U',2,0,1,A,1,AF,1,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdpbrfs('U',2,0,1,A,1,AF,1,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdpbrfs',INFOT,NOUT,LERR,OK)
*
*        cdpbcon
*
          SRNAMT = 'cdpbcon'
          INFOT = 1
          CALL cdpbcon('/',0,0,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpbcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbcon('U',-1,0,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpbcon',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbcon('U',1,-1,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpbcon',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpbcon('U',2,1,A,1,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdpbcon',INFOT,NOUT,LERR,OK)
*
*        cdpbequ
*
          SRNAMT = 'cdpbequ'
          INFOT = 1
          CALL cdpbequ('/',0,0,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpbequ',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdpbequ('U',-1,0,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpbequ',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdpbequ('U',1,-1,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpbequ',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdpbequ('U',2,1,A,1,R1,RCOND,ANRM,INFO)
          CALL CHKXER('cdpbequ',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRPO
*
      END
