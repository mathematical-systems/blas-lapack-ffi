        SUBROUTINE cslarft(direct,
     $   storev,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   tau,
     $   t,
     $   ldt)
c
c       lapack_slarft.c
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
        REAL  v(*)
        INTEGER  ldv
        REAL  tau(*)
        REAL  t(*)
        INTEGER  ldt

        CALL fslarft(direct,
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
