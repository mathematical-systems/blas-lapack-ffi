        SUBROUTINE csstein(n,
     $   d,
     $   e,
     $   m,
     $   w,
     $   iblock,
     $   isplit,
     $   z,
     $   ldz,
     $   work,
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_sstein.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        REAL  d(*)
        REAL  e(*)
        INTEGER  m
        REAL  w(*)
        INTEGER  iblock(*)
        INTEGER  isplit(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fsstein(n,
     $   d,
     $   e,
     $   m,
     $   w,
     $   iblock,
     $   isplit,
     $   z,
     $   ldz,
     $   work,
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
