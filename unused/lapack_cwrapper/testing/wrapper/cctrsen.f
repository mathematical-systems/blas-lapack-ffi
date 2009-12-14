        SUBROUTINE cctrsen(job,
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
c       lapack_ctrsen.c
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
        COMPLEX  t(*)
        INTEGER  ldt
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  w(*)
        INTEGER  m
        REAL  s
        REAL  sep
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fctrsen(job,
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
