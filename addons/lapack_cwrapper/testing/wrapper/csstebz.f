        SUBROUTINE csstebz(range,
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
c       lapack_sstebz.c
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
        REAL  vl
        REAL  vu
        INTEGER  il
        INTEGER  iu
        REAL  abstol
        REAL  d(*)
        REAL  e(*)
        INTEGER  m
        INTEGER  nsplit
        REAL  w(*)
        INTEGER  iblock(*)
        INTEGER  isplit(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsstebz(range,
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
