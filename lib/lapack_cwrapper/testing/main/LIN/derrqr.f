      SUBROUTINE DERRQR(PATH,NUNIT)
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
*  DERRQR tests the error exits for the DOUBLE PRECISION routines
*  that use the QR decomposition of a general matrix.
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
      EXTERNAL ALAESM,CHKXER,cdgeqr2,cdgeqrf,DGEQRS,cdorg2r,cdorgqr,
     +         cdorm2r,cdormqr
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
*     Error exits for QR factorization
*
*     cdgeqrf
*
      SRNAMT = 'cdgeqrf'
      INFOT = 1
      CALL cdgeqrf(-1,0,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqrf',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgeqrf(0,-1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqrf',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgeqrf(2,1,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqrf',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdgeqrf(1,2,A,1,B,W,1,INFO)
      CALL CHKXER('cdgeqrf',INFOT,NOUT,LERR,OK)
*
*     cdgeqr2
*
      SRNAMT = 'cdgeqr2'
      INFOT = 1
      CALL cdgeqr2(-1,0,A,1,B,W,INFO)
      CALL CHKXER('cdgeqr2',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdgeqr2(0,-1,A,1,B,W,INFO)
      CALL CHKXER('cdgeqr2',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdgeqr2(2,1,A,1,B,W,INFO)
      CALL CHKXER('cdgeqr2',INFOT,NOUT,LERR,OK)
*
*     DGEQRS
*
      SRNAMT = 'DGEQRS'
      INFOT = 1
      CALL DGEQRS(-1,0,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGEQRS(0,-1,0,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL DGEQRS(1,2,0,A,2,X,B,2,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL DGEQRS(0,0,-1,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL DGEQRS(2,1,0,A,1,X,B,2,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL DGEQRS(2,1,0,A,2,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL DGEQRS(1,1,2,A,1,X,B,1,W,1,INFO)
      CALL CHKXER('DGEQRS',INFOT,NOUT,LERR,OK)
*
*     cdorgqr
*
      SRNAMT = 'cdorgqr'
      INFOT = 1
      CALL cdorgqr(-1,0,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgqr(0,-1,0,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorgqr(1,2,0,A,1,X,W,2,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgqr(0,0,-1,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorgqr(1,1,2,A,1,X,W,1,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorgqr(2,2,0,A,1,X,W,2,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
      INFOT = 8
      CALL cdorgqr(2,2,0,A,2,X,W,1,INFO)
      CALL CHKXER('cdorgqr',INFOT,NOUT,LERR,OK)
*
*     cdorg2r
*
      SRNAMT = 'cdorg2r'
      INFOT = 1
      CALL cdorg2r(-1,0,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorg2r(0,-1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorg2r(1,2,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorg2r(0,0,-1,A,1,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorg2r(2,1,2,A,2,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorg2r(2,1,0,A,1,X,W,INFO)
      CALL CHKXER('cdorg2r',INFOT,NOUT,LERR,OK)
*
*     cdormqr
*
      SRNAMT = 'cdormqr'
      INFOT = 1
      CALL cdormqr('/','N',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdormqr('L','/',0,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdormqr('L','N',-1,0,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdormqr('L','N',0,-1,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormqr('L','N',0,0,-1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormqr('L','N',0,1,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdormqr('R','N',1,0,1,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormqr('L','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdormqr('R','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdormqr('L','N',2,1,0,A,2,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormqr('L','N',1,2,0,A,1,X,AF,1,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
      INFOT = 12
      CALL cdormqr('R','N',2,1,0,A,1,X,AF,2,W,1,INFO)
      CALL CHKXER('cdormqr',INFOT,NOUT,LERR,OK)
*
*     cdorm2r
*
      SRNAMT = 'cdorm2r'
      INFOT = 1
      CALL cdorm2r('/','N',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 2
      CALL cdorm2r('L','/',0,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 3
      CALL cdorm2r('L','N',-1,0,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 4
      CALL cdorm2r('L','N',0,-1,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2r('L','N',0,0,-1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2r('L','N',0,1,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 5
      CALL cdorm2r('R','N',1,0,1,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorm2r('L','N',2,1,0,A,1,X,AF,2,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 7
      CALL cdorm2r('R','N',1,2,0,A,1,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
      INFOT = 10
      CALL cdorm2r('L','N',2,1,0,A,2,X,AF,1,W,INFO)
      CALL CHKXER('cdorm2r',INFOT,NOUT,LERR,OK)
*
*     Print a summary line.
*
      CALL ALAESM(PATH,OK,NOUT)
*
      RETURN
*
*     End of DERRQR
*
      END
