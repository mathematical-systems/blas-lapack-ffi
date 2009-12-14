        SUBROUTINE cclabrd(m,
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
c       lapack_clabrd.c
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
        COMPLEX  a(*)
        INTEGER  lda
        REAL  d(*)
        REAL  e(*)
        COMPLEX  tauq(*)
        COMPLEX  taup(*)
        COMPLEX  x(*)
        INTEGER  ldx
        COMPLEX  y(*)
        INTEGER  ldy

        CALL fclabrd(m,
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
