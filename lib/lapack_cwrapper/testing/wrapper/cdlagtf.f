        SUBROUTINE cdlagtf(n,
     $   a,
     $   lambda,
     $   b,
     $   c,
     $   tol,
     $   d,
     $   in,
     $   info)
c
c       lapack_dlagtf.c
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
        DOUBLE PRECISION  a(*)
        DOUBLE PRECISION  lambda
        DOUBLE PRECISION  b(*)
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  tol
        DOUBLE PRECISION  d(*)
        INTEGER  in(*)
        INTEGER  info

        CALL fdlagtf(n,
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
