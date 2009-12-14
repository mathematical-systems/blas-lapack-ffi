        SUBROUTINE cctrsna(job,
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
     $   rwork,
     $   info)
c
c       lapack_ctrsna.c
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
        COMPLEX  t(*)
        INTEGER  ldt
        COMPLEX  vl(*)
        INTEGER  ldvl
        COMPLEX  vr(*)
        INTEGER  ldvr
        REAL  s(*)
        REAL  sep(*)
        INTEGER  mm
        INTEGER  m
        COMPLEX  work(*)
        INTEGER  ldwork
        REAL  rwork(*)
        INTEGER  info

        CALL fctrsna(job,
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
     $   rwork,
     $   info)
        RETURN
        END
