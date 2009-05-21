        SUBROUTINE cdtrsen(job,
     $   compq,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   wr,
     $   wi,
     $   m,
     $   s,
     $   sep,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_dtrsen.c
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
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        INTEGER  m
        DOUBLE PRECISION  s
        DOUBLE PRECISION  sep
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fdtrsen(job,
     $   compq,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   wr,
     $   wi,
     $   m,
     $   s,
     $   sep,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
