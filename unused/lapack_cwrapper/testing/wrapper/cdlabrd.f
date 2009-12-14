        SUBROUTINE cdlabrd(m,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   x,
     $   ldx,
     $   y,
     $   ldy)
c
c       lapack_dlabrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        INTEGER  nb
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  tauq(*)
        DOUBLE PRECISION  taup(*)
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  y(*)
        INTEGER  ldy

        CALL fdlabrd(m,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   x,
     $   ldx,
     $   y,
     $   ldy)
        RETURN
        END
