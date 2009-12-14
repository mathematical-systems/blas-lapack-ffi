        SUBROUTINE cstrsen(job,
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
c       lapack_strsen.c
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
        REAL  t(*)
        INTEGER  ldt
        REAL  q(*)
        INTEGER  ldq
        REAL  wr(*)
        REAL  wi(*)
        INTEGER  m
        REAL  s
        REAL  sep
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fstrsen(job,
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
