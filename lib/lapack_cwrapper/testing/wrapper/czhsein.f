        SUBROUTINE czhsein(side,
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
c       lapack_zhsein.c
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
        COMPLEX*16  h(*)
        INTEGER  ldh
        COMPLEX*16  w(*)
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  ifaill(*)
        INTEGER  ifailr(*)
        INTEGER  info

        CALL fzhsein(side,
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
