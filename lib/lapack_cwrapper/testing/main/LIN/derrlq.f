      SUBROUTINE DERRLQ(PATH,NUNIT)
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
*  DERRLQ tests the error exits for the DOUBLE PRECISION routines
*  that use the LQ decomposition of a general matrix.
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
      EXTERNAL ALAESM,CHKXER,cdgelq2,cdgelqf,DGELQS,cdorgl2,cdorglq,
     +         cdorml2,cdormlq
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
*     Error exits for LQ factorization
*
*     cdgelqf
*
      SRNAMT = 'cdgelqf'
      INFOT = 1
      CALL cdgelqf(-1,0,A,1,B,W,1,INFO)
      CALL CHKXER('cdgelqf',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgelqf(0,-1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgelqf',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgelqf(2,1,A,1,B,W,2,INFO)
      CALL CHKXER('cdgelqf',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdgelqf(2,1,A,2,B,W,1,INFO)
      CALL CHKXER('cdgelqf',INFOT,NOUT,LERR,OK)
*
*     cdgelq2
*
      SRNAMT = 'cdgelq2'
      INFOT = 1
      CALL cdgelq2(-1,0,A,1,B,W,INFO)
      CALL CHKXER('cdgelq2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgelq2(0,-1,A,1,B,W,INFO)
      CALL CHKXER('cdgelq2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgelq2(2,1,A,1,B,W,INFO)
      CALL CHKXER('cdgelq2',INFOT,NOUT,LERR,OK)
*
*     DGELQS
*
      SRNAMT = 'DGELQS'
      INFOT = 1
      CALL DGELQS(-1,0,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGELQS(0,-1,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGELQS(2,1,0,A,2,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL DGELQS(0,0,-1,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL DGELQS(2,2,0,A,1,X,B,2,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL DGELQS(1,2,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL DGELQS(1,1,2,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGELQS',INFOT,NOUT,LERR,OK)
*
*     cdorglq
*
      SRNAMT = 'cdorglq'
      INFOT = 1
      CALL cdorglq(-1,0,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorglq(0,-1,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorglq(2,1,0,A,2,X,W,2,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorglq(0,0,-1,A,1,X,W,1,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorglq(1,1,2,A,1,X,W,1,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorglq(2,2,0,A,1,X,W,2,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL cdorglq(2,2,0,A,2,X,W,1,INFO)
      CALL CHKXER('cdorglq',INFOT,NOUT,LERR,OK)
*
*     cdorgl2
*
      SRNAMT = 'cdorgl2'
      INFOT = 1
      CALL cdorgl2(-1,0,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgl2(0,-1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgl2(2,1,0,A,2,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgl2(0,0,-1,A,1,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgl2(1,1,2,A,1,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorgl2(2,2,0,A,1,X,W,INFO)
      CALL CHKXER('cdorgl2',INFOT,NOUT,LERR,OK)
*
*     cdormlq
*
      SRNAMT = 'cdormlq'
      INFOT = 1
      CALL cdormlq('/','N',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdormlq('L','/',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdormlq('L','N',-1,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdormlq('L','N',0,-1,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormlq('L','N',0,0,-1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormlq('L','N',0,1,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormlq('R','N',1,0,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormlq('L','N',2,0,2,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormlq('R','N',0,2,2,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdormlq('L','N',2,1,0,A,2,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormlq('L','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormlq('R','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormlq',INFOT,NOUT,LERR,OK)
*
*     cdorml2
*
      SRNAMT = 'cdorml2'
      INFOT = 1
      CALL cdorml2('/','N',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorml2('L','/',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorml2('L','N',-1,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdorml2('L','N',0,-1,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorml2('L','N',0,0,-1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorml2('L','N',0,1,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorml2('R','N',1,0,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorml2('L','N',2,1,2,A,1,X,AF,2,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorml2('R','N',1,2,2,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdorml2('L','N',2,1,0,A,2,X,AF,1,W,INFO)
      CALL CHKXER('cdorml2',INFOT,NOUT,LERR,OK)
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRLQ
*
      END
