        SUBROUTINE cdstebz(range,
     $   order,
     $   n,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   d,
     $   e,
     $   m,
     $   nsplit,
     $   w,
     $   iblock,
     $   isplit,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dstebz.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  range
        CHARACTER  order
        INTEGER  n
        DOUBLE PRECISION  vl
        DOUBLE PRECISION  vu
        INTEGER  il
        INTEGER  iu
        DOUBLE PRECISION  abstol
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        INTEGER  m
        INTEGER  nsplit
        DOUBLE PRECISION  w(*)
        INTEGER  iblock(*)
        INTEGER  isplit(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdstebz(range,
     $   order,
     $   n,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   d,
     $   e,
     $   m,
     $   nsplit,
     $   w,
     $   iblock,
     $   isplit,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
