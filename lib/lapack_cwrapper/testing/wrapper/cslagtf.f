        SUBROUTINE cslagtf(n,
     $   a,
     $   lambda,
     $   b,
     $   c,
     $   tol,
     $   d,
     $   in,
     $   info)
c
c       lapack_slagtf.c
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
        REAL  a(*)
        REAL  lambda
        REAL  b(*)
        REAL  c(*)
        REAL  tol
        REAL  d(*)
        INTEGER  in(*)
        INTEGER  info

        CALL fslagtf(n,
     $   a,
     $   lambda,
     $   b,
     $   c,
     $   tol,
     $   d,
     $   in,
     $   info)
        RETURN
        END
