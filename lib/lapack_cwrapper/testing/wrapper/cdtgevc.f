        SUBROUTINE cdtgevc(side,
     $   howmny,
     $   select,
     $   n,
     $   s,
     $   lds,
     $   p,
     $   ldp,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   info)
c
c       lapack_dtgevc.c
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
        DOUBLE PRECISION  s(*)
        INTEGER  lds
        DOUBLE PRECISION  p(*)
        INTEGER  ldp
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdtgevc(side,
     $   howmny,
     $   select,
     $   n,
     $   s,
     $   lds,
     $   p,
     $   ldp,
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
