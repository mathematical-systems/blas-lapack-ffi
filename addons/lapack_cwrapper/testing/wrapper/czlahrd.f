        SUBROUTINE czlahrd(n,
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
c       lapack_zlahrd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  tau(*)
        COMPLEX*16  t(*)
        INTEGER  ldt
        COMPLEX*16  y(*)
        INTEGER  ldy

        CALL fzlahrd(n,
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
