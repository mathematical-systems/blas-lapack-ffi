        SUBROUTINE cdlarfb(side,
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
c       lapack_dlarfb.c
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
        DOUBLE PRECISION  v(*)
        INTEGER  ldv
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)
        INTEGER  ldwork

        CALL fdlarfb(side,
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
