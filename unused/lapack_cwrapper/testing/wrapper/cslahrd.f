        SUBROUTINE cslahrd(n,
     $   k,
     $   nb,
     $   a,
     $   lda,
     $   tau,
     $   t,
     $   ldt,
     $   y,
     $   ldy)
c
c       lapack_slahrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  k
        INTEGER  nb
        REAL  a(*)
        INTEGER  lda
        REAL  tau(*)
        REAL  t(*)
        INTEGER  ldt
        REAL  y(*)
        INTEGER  ldy

        CALL fslahrd(n,
     $   k,
     $   nb,
     $   a,
     $   lda,
     $   tau,
     $   t,
     $   ldt,
     $   y,
     $   ldy)
        RETURN
        END
