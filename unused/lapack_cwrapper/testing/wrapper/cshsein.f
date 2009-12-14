        SUBROUTINE cshsein(side,
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
c       lapack_shsein.c
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
        REAL  h(*)
        INTEGER  ldh
        REAL  wr(*)
        REAL  wi(*)
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        REAL  work(*)
        INTEGER  ifaill(*)
        INTEGER  ifailr(*)
        INTEGER  info

        CALL fshsein(side,
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
