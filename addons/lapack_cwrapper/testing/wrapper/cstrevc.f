        SUBROUTINE cstrevc(side,
     $   howmny,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   info)
c
c       lapack_strevc.c
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
        CHARACTER  howmny
        LOGICAL  select(*)
        INTEGER  n
        REAL  t(*)
        INTEGER  ldt
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        REAL  work(*)
        INTEGER  info

        CALL fstrevc(side,
     $   howmny,
     $   select,
     $   n,
     $   t,
     $   ldt,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   info)
        RETURN
        END
