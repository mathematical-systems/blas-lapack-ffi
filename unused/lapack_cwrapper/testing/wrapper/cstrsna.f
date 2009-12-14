        SUBROUTINE cstrsna(job,
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
c       lapack_strsna.c
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
        REAL  t(*)
        INTEGER  ldt
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        REAL  s(*)
        REAL  sep(*)
        INTEGER  mm
        INTEGER  m
        REAL  work(*)
        INTEGER  ldwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fstrsna(job,
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
