        SUBROUTINE cztrsna(job,
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
c       lapack_ztrsna.c
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
        COMPLEX*16  t(*)
        INTEGER  ldt
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  sep(*)
        INTEGER  mm
        INTEGER  m
        COMPLEX*16  work(*)
        INTEGER  ldwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fztrsna(job,
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
