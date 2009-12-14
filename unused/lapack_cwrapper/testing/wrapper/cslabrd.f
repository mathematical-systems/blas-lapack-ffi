        SUBROUTINE cslabrd(m,
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
c       lapack_slabrd.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  d(*)
        REAL  e(*)
        REAL  tauq(*)
        REAL  taup(*)
        REAL  x(*)
        INTEGER  ldx
        REAL  y(*)
        INTEGER  ldy

        CALL fslabrd(m,
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
