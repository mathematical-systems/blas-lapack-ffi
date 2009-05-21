        SUBROUTINE czlabrd(m,
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
c       lapack_zlabrd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  tauq(*)
        COMPLEX*16  taup(*)
        COMPLEX*16  x(*)
        INTEGER  ldx
        COMPLEX*16  y(*)
        INTEGER  ldy

        CALL fzlabrd(m,
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
