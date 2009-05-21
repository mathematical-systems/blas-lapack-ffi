      SUBROUTINE DERRQL(PATH,NUNIT)
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
*  DERRQL tests the error exits for the DOUBLE PRECISION routines
*  that use the QL decomposition of a general matrix.
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
      EXTERNAL ALAESM,CHKXER,cdgeql2,cdgeqlf,DGEQLS,cdorg2l,cdorgql,
     +         cdorm2l,cdormql
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
*     Error exits for QL factorization
*
*     cdgeqlf
*
      SRNAMT = 'cdgeqlf'
      INFOT = 1
      CALL cdgeqlf(-1,0,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqlf',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgeqlf(0,-1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqlf',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgeqlf(2,1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqlf',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdgeqlf(1,2,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqlf',INFOT,NOUT,LERR,OK)
*
*     cdgeql2
*
      SRNAMT = 'cdgeql2'
      INFOT = 1
      CALL cdgeql2(-1,0,A,1,B,W,INFO)
      CALL CHKXER('cdgeql2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgeql2(0,-1,A,1,B,W,INFO)
      CALL CHKXER('cdgeql2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgeql2(2,1,A,1,B,W,INFO)
      CALL CHKXER('cdgeql2',INFOT,NOUT,LERR,OK)
*
*     DGEQLS
*
      SRNAMT = 'DGEQLS'
      INFOT = 1
      CALL DGEQLS(-1,0,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGEQLS(0,-1,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGEQLS(1,2,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL DGEQLS(0,0,-1,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL DGEQLS(2,1,0,A,1,X,B,2,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL DGEQLS(2,1,0,A,2,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL DGEQLS(1,1,2,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQLS',INFOT,NOUT,LERR,OK)
*
*     cdorgql
*
      SRNAMT = 'cdorgql'
      INFOT = 1
      CALL cdorgql(-1,0,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgql(0,-1,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgql(1,2,0,A,1,X,W,2,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgql(0,0,-1,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgql(1,1,2,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorgql(2,1,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL cdorgql(2,2,0,A,2,X,W,1,INFO)
      CALL CHKXER('cdorgql',INFOT,NOUT,LERR,OK)
*
*     cdorg2l
*
      SRNAMT = 'cdorg2l'
      INFOT = 1
      CALL cdorg2l(-1,0,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorg2l(0,-1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorg2l(1,2,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorg2l(0,0,-1,A,1,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorg2l(2,1,2,A,2,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorg2l(2,1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2l',INFOT,NOUT,LERR,OK)
*
*     cdormql
*
      SRNAMT = 'cdormql'
      INFOT = 1
      CALL cdormql('/','N',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdormql('L','/',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdormql('L','N',-1,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdormql('L','N',0,-1,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormql('L','N',0,0,-1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormql('L','N',0,1,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormql('R','N',1,0,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormql('L','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormql('R','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdormql('L','N',2,1,0,A,2,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormql('L','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormql('R','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormql',INFOT,NOUT,LERR,OK)
*
*     cdorm2l
*
      SRNAMT = 'cdorm2l'
      INFOT = 1
      CALL cdorm2l('/','N',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorm2l('L','/',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorm2l('L','N',-1,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdorm2l('L','N',0,-1,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2l('L','N',0,0,-1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2l('L','N',0,1,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2l('R','N',1,0,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorm2l('L','N',2,1,0,A,1,X,AF,2,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorm2l('R','N',1,2,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdorm2l('L','N',2,1,0,A,2,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2l',INFOT,NOUT,LERR,OK)
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRQL
*
      END
