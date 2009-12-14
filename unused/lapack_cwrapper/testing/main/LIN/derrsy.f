      SUBROUTINE DERRSY(PATH,NUNIT)
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
*  DERRSY tests the error exits for the DOUBLE PRECISION routines
*  for symmetric indefinite matrices.
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
      INTEGER IP(NMAX),IW(NMAX)
      DOUBLE PRECISION A(NMAX,NMAX),AF(NMAX,NMAX),B(NMAX),R1(NMAX),
     +                 R2(NMAX),W(3*NMAX),X(NMAX)
*     ..
*     .. External Functions ..
      LOGICAL LSAMEN
      EXTERNAL LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdspcon,cdsprfs,cdsptrf,cdsptri,cdsptrs,
     +         cdsycon,cdsyrfs,cdsytf2,cdsytrf,cdsytri,cdsytrs
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
      ANRM = 1.0D0
      RCOND = 1.0D0
      OK = .TRUE.
*
      IF (LSAMEN(2,C2,'SY')) THEN
*
*        Test error exits of the routines that use the Bunch-Kaufman
*        factorization of a symmetric indefinite matrix.
*
*        cdsytrf
*
          SRNAMT = 'cdsytrf'
          INFOT = 1
          CALL cdsytrf('/',0,A,1,IP,W,1,INFO)
          CALL CHKXER('cdsytrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsytrf('U',-1,A,1,IP,W,1,INFO)
          CALL CHKXER('cdsytrf',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdsytrf('U',2,A,1,IP,W,4,INFO)
          CALL CHKXER('cdsytrf',INFOT,NOUT,LERR,OK)
*
*        cdsytf2
*
          SRNAMT = 'cdsytf2'
          INFOT = 1
          CALL cdsytf2('/',0,A,1,IP,INFO)
          CALL CHKXER('cdsytf2',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsytf2('U',-1,A,1,IP,INFO)
          CALL CHKXER('cdsytf2',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdsytf2('U',2,A,1,IP,INFO)
          CALL CHKXER('cdsytf2',INFOT,NOUT,LERR,OK)
*
*        cdsytri
*
          SRNAMT = 'cdsytri'
          INFOT = 1
          CALL cdsytri('/',0,A,1,IP,W,INFO)
          CALL CHKXER('cdsytri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsytri('U',-1,A,1,IP,W,INFO)
          CALL CHKXER('cdsytri',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdsytri('U',2,A,1,IP,W,INFO)
          CALL CHKXER('cdsytri',INFOT,NOUT,LERR,OK)
*
*        cdsytrs
*
          SRNAMT = 'cdsytrs'
          INFOT = 1
          CALL cdsytrs('/',0,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdsytrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsytrs('U',-1,0,A,1,IP,B,1,INFO)
          CALL CHKXER('cdsytrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsytrs('U',0,-1,A,1,IP,B,1,INFO)
          CALL CHKXER('cdsytrs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdsytrs('U',2,1,A,1,IP,B,2,INFO)
          CALL CHKXER('cdsytrs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdsytrs('U',2,1,A,2,IP,B,1,INFO)
          CALL CHKXER('cdsytrs',INFOT,NOUT,LERR,OK)
*
*        cdsyrfs
*
          SRNAMT = 'cdsyrfs'
          INFOT = 1
          CALL cdsyrfs('/',0,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsyrfs('U',-1,0,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsyrfs('U',0,-1,A,1,AF,1,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdsyrfs('U',2,1,A,1,AF,2,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdsyrfs('U',2,1,A,2,AF,1,IP,B,2,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdsyrfs('U',2,1,A,2,AF,2,IP,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
          INFOT = 12
          CALL cdsyrfs('U',2,1,A,2,AF,2,IP,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsyrfs',INFOT,NOUT,LERR,OK)
*
*        cdsycon
*
          SRNAMT = 'cdsycon'
          INFOT = 1
          CALL cdsycon('/',0,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdsycon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsycon('U',-1,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdsycon',INFOT,NOUT,LERR,OK)
          INFOT = 4
          CALL cdsycon('U',2,A,1,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdsycon',INFOT,NOUT,LERR,OK)
          INFOT = 6
          CALL cdsycon('U',1,A,1,IP,-1.0D0,RCOND,W,IW,INFO)
          CALL CHKXER('cdsycon',INFOT,NOUT,LERR,OK)
*
      ELSE IF (LSAMEN(2,C2,'SP')) THEN
*
*        Test error exits of the routines that use the Bunch-Kaufman
*        factorization of a symmetric indefinite packed matrix.
*
*        cdsptrf
*
          SRNAMT = 'cdsptrf'
          INFOT = 1
          CALL cdsptrf('/',0,A,IP,INFO)
          CALL CHKXER('cdsptrf',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsptrf('U',-1,A,IP,INFO)
          CALL CHKXER('cdsptrf',INFOT,NOUT,LERR,OK)
*
*        cdsptri
*
          SRNAMT = 'cdsptri'
          INFOT = 1
          CALL cdsptri('/',0,A,IP,W,INFO)
          CALL CHKXER('cdsptri',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsptri('U',-1,A,IP,W,INFO)
          CALL CHKXER('cdsptri',INFOT,NOUT,LERR,OK)
*
*        cdsptrs
*
          SRNAMT = 'cdsptrs'
          INFOT = 1
          CALL cdsptrs('/',0,0,A,IP,B,1,INFO)
          CALL CHKXER('cdsptrs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsptrs('U',-1,0,A,IP,B,1,INFO)
          CALL CHKXER('cdsptrs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsptrs('U',0,-1,A,IP,B,1,INFO)
          CALL CHKXER('cdsptrs',INFOT,NOUT,LERR,OK)
          INFOT = 7
          CALL cdsptrs('U',2,1,A,IP,B,1,INFO)
          CALL CHKXER('cdsptrs',INFOT,NOUT,LERR,OK)
*
*        cdsprfs
*
          SRNAMT = 'cdsprfs'
          INFOT = 1
          CALL cdsprfs('/',0,0,A,AF,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsprfs',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdsprfs('U',-1,0,A,AF,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsprfs',INFOT,NOUT,LERR,OK)
          INFOT = 3
          CALL cdsprfs('U',0,-1,A,AF,IP,B,1,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsprfs',INFOT,NOUT,LERR,OK)
          INFOT = 8
          CALL cdsprfs('U',2,1,A,AF,IP,B,1,X,2,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsprfs',INFOT,NOUT,LERR,OK)
          INFOT = 10
          CALL cdsprfs('U',2,1,A,AF,IP,B,2,X,1,R1,R2,W,IW,INFO)
          CALL CHKXER('cdsprfs',INFOT,NOUT,LERR,OK)
*
*        cdspcon
*
          SRNAMT = 'cdspcon'
          INFOT = 1
          CALL cdspcon('/',0,A,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdspcon',INFOT,NOUT,LERR,OK)
          INFOT = 2
          CALL cdspcon('U',-1,A,IP,ANRM,RCOND,W,IW,INFO)
          CALL CHKXER('cdspcon',INFOT,NOUT,LERR,OK)
          INFOT = 5
          CALL cdspcon('U',1,A,IP,-1.0D0,RCOND,W,IW,INFO)
          CALL CHKXER('cdspcon',INFOT,NOUT,LERR,OK)
      END IF
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRSY
*
      END
