        SUBROUTINE cdlarrv(n,
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
c       lapack_dlarrv.c
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
        DOUBLE PRECISION  l(*)
        INTEGER  isplit(*)
        INTEGER  m
        DOUBLE PRECISION  w(*)
        INTEGER  iblock(*)
        DOUBLE PRECISION  gersch(*)
        DOUBLE PRECISION  tol
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        INTEGER  isuppz(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlarrv(n,
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
