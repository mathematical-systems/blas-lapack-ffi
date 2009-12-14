        SUBROUTINE cdlahrd(n,
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
c       lapack_dlahrd.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  y(*)
        INTEGER  ldy

        CALL fdlahrd(n,
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
