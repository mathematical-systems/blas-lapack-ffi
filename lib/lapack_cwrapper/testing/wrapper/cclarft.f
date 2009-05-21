        SUBROUTINE cclarft(direct,
     $   storev,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   tau,
     $   t,
     $   ldt)
c
c       lapack_clarft.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  direct
        CHARACTER  storev
        INTEGER  n
        INTEGER  k
        COMPLEX  v(*)
        INTEGER  ldv
        COMPLEX  tau(*)
        COMPLEX  t(*)
        INTEGER  ldt

        CALL fclarft(direct,
     $   storev,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   tau,
     $   t,
     $   ldt)
        RETURN
        END
