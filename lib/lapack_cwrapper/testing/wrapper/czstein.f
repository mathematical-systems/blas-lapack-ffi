        SUBROUTINE czstein(n,
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
c       lapack_zstein.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        INTEGER  m
        DOUBLE PRECISION  w(*)
        INTEGER  iblock(*)
        INTEGER  isplit(*)
        COMPLEX*16  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fzstein(n,
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
