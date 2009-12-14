        SUBROUTINE cstgevc(side,
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
c       lapack_stgevc.c
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
        REAL  s(*)
        INTEGER  lds
        REAL  p(*)
        INTEGER  ldp
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        REAL  work(*)
        INTEGER  info

        CALL fstgevc(side,
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
