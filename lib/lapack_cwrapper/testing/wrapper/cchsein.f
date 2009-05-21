        SUBROUTINE cchsein(side,
     $   eigsrc,
     $   initv,
     $   select,
     $   n,
     $   h,
     $   ldh,
     $   w,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   rwork,
     $   ifaill,
     $   ifailr,
     $   info)
c
c       lapack_chsein.c
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
        COMPLEX  h(*)
        INTEGER  ldh
        COMPLEX  w(*)
        COMPLEX  vl(*)
        INTEGER  ldvl
        COMPLEX  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  ifaill(*)
        INTEGER  ifailr(*)
        INTEGER  info

        CALL fchsein(side,
     $   eigsrc,
     $   initv,
     $   select,
     $   n,
     $   h,
     $   ldh,
     $   w,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   rwork,
     $   ifaill,
     $   ifailr,
     $   info)
        RETURN
        END
