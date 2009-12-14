        SUBROUTINE cztgevc(side,
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
     $   rwork,
     $   info)
c
c       lapack_ztgevc.c
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
        COMPLEX*16  s(*)
        INTEGER  lds
        COMPLEX*16  p(*)
        INTEGER  ldp
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fztgevc(side,
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
     $   rwork,
     $   info)
        RETURN
        END
