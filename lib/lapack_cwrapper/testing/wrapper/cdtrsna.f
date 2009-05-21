        SUBROUTINE cdtrsna(job,
     $   howmny,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   s,
     $   sep,
     $   mm,
     $   m,
     $   work,
     $   ldwork,
     $   iwork,
     $   info)
c
c       lapack_dtrsna.c
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
        CHARACTER  howmny
        LOGICAL  select(*)
        INTEGER  n
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  sep(*)
        INTEGER  mm
        INTEGER  m
        DOUBLE PRECISION  work(*)
        INTEGER  ldwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdtrsna(job,
     $   howmny,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   s,
     $   sep,
     $   mm,
     $   m,
     $   work,
     $   ldwork,
     $   iwork,
     $   info)
        RETURN
        END
