        SUBROUTINE cztrsen(job,
     $   compq,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   w,
     $   m,
     $   s,
     $   sep,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ztrsen.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  job
        CHARACTER  compq
        LOGICAL  select(*)
        INTEGER  n
        COMPLEX*16  t(*)
        INTEGER  ldt
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  w(*)
        INTEGER  m
        DOUBLE PRECISION  s
        DOUBLE PRECISION  sep
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fztrsen(job,
     $   compq,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   w,
     $   m,
     $   s,
     $   sep,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
