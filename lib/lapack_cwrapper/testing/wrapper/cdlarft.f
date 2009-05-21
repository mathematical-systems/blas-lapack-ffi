        SUBROUTINE cdlarft(direct,
     $   storev,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   tau,
     $   t,
     $   ldt)
c
c       lapack_dlarft.c
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
        DOUBLE PRECISION  v(*)
        INTEGER  ldv
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  t(*)
        INTEGER  ldt

        CALL fdlarft(direct,
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
