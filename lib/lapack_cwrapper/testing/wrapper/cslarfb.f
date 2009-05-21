        SUBROUTINE cslarfb(side,
     $   trans,
     $   direct,
     $   storev,
     $   m,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   t,
     $   ldt,
     $   c,
     $   ldc,
     $   work,
     $   ldwork)
c
c       lapack_slarfb.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        CHARACTER  trans
        CHARACTER  direct
        CHARACTER  storev
        INTEGER  m
        INTEGER  n
        INTEGER  k
        REAL  v(*)
        INTEGER  ldv
        REAL  t(*)
        INTEGER  ldt
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)
        INTEGER  ldwork

        CALL fslarfb(side,
     $   trans,
     $   direct,
     $   storev,
     $   m,
     $   n,
     $   k,
     $   v,
     $   ldv,
     $   t,
     $   ldt,
     $   c,
     $   ldc,
     $   work,
     $   ldwork)
        RETURN
        END
