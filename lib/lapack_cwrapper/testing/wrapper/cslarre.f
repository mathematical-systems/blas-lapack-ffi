        SUBROUTINE cslarre(n,
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
c       lapack_slarre.c
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
        REAL  tol
        INTEGER  nsplit
        INTEGER  isplit(*)
        INTEGER  m
        REAL  w(*)
        REAL  woff(*)
        REAL  gersch(*)
        REAL  work(*)
        INTEGER  info

        CALL fslarre(n,
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
