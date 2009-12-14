        SUBROUTINE cdhsein(side,
     $   eigsrc,
     $   initv,
     $   select,
     $   n,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   ifaill,
     $   ifailr,
     $   info)
c
c       lapack_dhsein.c
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
        CHARACTER  eigsrc
        CHARACTER  initv
        LOGICAL  select(*)
        INTEGER  n
        DOUBLE PRECISION  h(*)
        INTEGER  ldh
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        DOUBLE PRECISION  work(*)
        INTEGER  ifaill(*)
        INTEGER  ifailr(*)
        INTEGER  info

        CALL fdhsein(side,
     $   eigsrc,
     $   initv,
     $   select,
     $   n,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   ifaill,
     $   ifailr,
     $   info)
        RETURN
        END
