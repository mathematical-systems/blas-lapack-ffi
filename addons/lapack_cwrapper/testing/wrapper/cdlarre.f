        SUBROUTINE cdlarre(n,
     $   d,
     $   e,
     $   tol,
     $   nsplit,
     $   isplit,
     $   m,
     $   w,
     $   woff,
     $   gersch,
     $   work,
     $   info)
c
c       lapack_dlarre.c
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
        DOUBLE PRECISION  tol
        INTEGER  nsplit
        INTEGER  isplit(*)
        INTEGER  m
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  woff(*)
        DOUBLE PRECISION  gersch(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlarre(n,
     $   d,
     $   e,
     $   tol,
     $   nsplit,
     $   isplit,
     $   m,
     $   w,
     $   woff,
     $   gersch,
     $   work,
     $   info)
        RETURN
        END
