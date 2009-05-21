      SUBROUTINE DERRRQ(PATH,NUNIT)
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
*  DERRRQ tests the error exits for the DOUBLE PRECISION routines
*  that use the RQ decomposition of a general matrix.
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
      INTEGER I,INFO,J
*     ..
*     .. Local Arrays ..
      DOUBLE PRECISION A(NMAX,NMAX),AF(NMAX,NMAX),B(NMAX),W(NMAX),
     +                 X(NMAX)
*     ..
*     .. External Subroutines ..
      EXTERNAL ALAESM,CHKXER,cdgerq2,cdgerqf,DGERQS,cdorgr2,cdorgrq,
     +         cdormr2,cdormrq
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
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1,NMAX
          DO 10 I = 1,NMAX
              A(I,J) = 1.D0/DBLE(I+J)
              AF(I,J) = 1.D0/DBLE(I+J)
   10     CONTINUE
          B(J) = 0.D0
          W(J) = 0.D0
          X(J) = 0.D0
   20 CONTINUE
      OK = .TRUE.
*
*     Error exits for RQ factorization
*
*     cdgerqf
*
      SRNAMT = 'cdgerqf'
      INFOT = 1
      CALL cdgerqf(-1,0,A,1,B,W,1,INFO)
      CALL CHKXER('cdgerqf',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgerqf(0,-1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgerqf',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgerqf(2,1,A,1,B,W,2,INFO)
      CALL CHKXER('cdgerqf',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdgerqf(2,1,A,2,B,W,1,INFO)
      CALL CHKXER('cdgerqf',INFOT,NOUT,LERR,OK)
*
*     cdgerq2
*
      SRNAMT = 'cdgerq2'
      INFOT = 1
      CALL cdgerq2(-1,0,A,1,B,W,INFO)
      CALL CHKXER('cdgerq2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgerq2(0,-1,A,1,B,W,INFO)
      CALL CHKXER('cdgerq2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgerq2(2,1,A,1,B,W,INFO)
      CALL CHKXER('cdgerq2',INFOT,NOUT,LERR,OK)
*
*     DGERQS
*
      SRNAMT = 'DGERQS'
      INFOT = 1
      CALL DGERQS(-1,0,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGERQS(0,-1,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGERQS(2,1,0,A,2,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL DGERQS(0,0,-1,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL DGERQS(2,2,0,A,1,X,B,2,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL DGERQS(2,2,0,A,2,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL DGERQS(1,1,2,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGERQS',INFOT,NOUT,LERR,OK)
*
*     cdorgrq
*
      SRNAMT = 'cdorgrq'
      INFOT = 1
      CALL cdorgrq(-1,0,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgrq(0,-1,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgrq(2,1,0,A,2,X,W,2,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgrq(0,0,-1,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgrq(1,2,2,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorgrq(2,2,0,A,1,X,W,2,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL cdorgrq(2,2,0,A,2,X,W,1,INFO)
      CALL CHKXER('cdorgrq',INFOT,NOUT,LERR,OK)
*
*     cdorgr2
*
      SRNAMT = 'cdorgr2'
      INFOT = 1
      CALL cdorgr2(-1,0,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgr2(0,-1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgr2(2,1,0,A,2,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgr2(0,0,-1,A,1,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgr2(1,2,2,A,2,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorgr2(2,2,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgr2',INFOT,NOUT,LERR,OK)
*
*     cdormrq
*
      SRNAMT = 'cdormrq'
      INFOT = 1
      CALL cdormrq('/','N',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdormrq('L','/',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdormrq('L','N',-1,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdormrq('L','N',0,-1,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormrq('L','N',0,0,-1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormrq('L','N',0,1,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormrq('R','N',1,0,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormrq('L','N',2,1,2,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormrq('R','N',1,2,2,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdormrq('L','N',2,1,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormrq('L','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormrq('R','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormrq',INFOT,NOUT,LERR,OK)
*
*     cdormr2
*
      SRNAMT = 'cdormr2'
      INFOT = 1
      CALL cdormr2('/','N',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdormr2('L','/',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdormr2('L','N',-1,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdormr2('L','N',0,-1,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormr2('L','N',0,0,-1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormr2('L','N',0,1,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormr2('R','N',1,0,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormr2('L','N',2,1,2,A,1,X,AF,2,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormr2('R','N',1,2,2,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdormr2('L','N',2,1,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdormr2',INFOT,NOUT,LERR,OK)
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRRQ
*
      END
