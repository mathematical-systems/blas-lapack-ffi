        SUBROUTINE cslasy2(ltranl,
     $   ltranr,
     $   isgn,
     $   n1,
     $   n2,
     $   tl,
     $   ldtl,
     $   tr,
     $   ldtr,
     $   b,
     $   ldb,
     $   scale,
     $   x,
     $   ldx,
     $   xnorm,
     $   info)
c
c       lapack_slasy2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  ltranl
        LOGICAL  ltranr
        INTEGER  isgn
        INTEGER  n1
        INTEGER  n2
        REAL  tl(*)
        INTEGER  ldtl
        REAL  tr(*)
        INTEGER  ldtr
        REAL  b(*)
        INTEGER  ldb
        REAL  scale
        REAL  x(*)
        INTEGER  ldx
        REAL  xnorm
        INTEGER  info

        CALL fslasy2(ltranl,
     $   ltranr,
     $   isgn,
     $   n1,
     $   n2,
     $   tl,
     $   ldtl,
     $   tr,
     $   ldtr,
     $   b,
     $   ldb,
     $   scale,
     $   x,
     $   ldx,
     $   xnorm,
     $   info)
        RETURN
        END
