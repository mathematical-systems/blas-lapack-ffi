        SUBROUTINE czlarzb(side,
     $   trans,
     $   direct,
     $   storev,
     $   m,
     $   n,
     $   k,
     $   l,
     $   v,
     $   ldv,
     $   t,
     $   ldt,
     $   c,
     $   ldc,
     $   work,
     $   ldwork)
c
c       lapack_zlarzb.c
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
        INTEGER  l
        COMPLEX*16  v(*)
        INTEGER  ldv
        COMPLEX*16  t(*)
        INTEGER  ldt
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)
        INTEGER  ldwork

        CALL fzlarzb(side,
     $   trans,
     $   direct,
     $   storev,
     $   m,
     $   n,
     $   k,
     $   l,
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
