        SUBROUTINE cslarrv(n,
     $   d,
     $   l,
     $   isplit,
     $   m,
     $   w,
     $   iblock,
     $   gersch,
     $   tol,
     $   z,
     $   ldz,
     $   isuppz,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_slarrv.c
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
        REAL  l(*)
        INTEGER  isplit(*)
        INTEGER  m
        REAL  w(*)
        INTEGER  iblock(*)
        REAL  gersch(*)
        REAL  tol
        REAL  z(*)
        INTEGER  ldz
        INTEGER  isuppz(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslarrv(n,
     $   d,
     $   l,
     $   isplit,
     $   m,
     $   w,
     $   iblock,
     $   gersch,
     $   tol,
     $   z,
     $   ldz,
     $   isuppz,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
