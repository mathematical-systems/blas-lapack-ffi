        SUBROUTINE cdlagts(job,
     $   n,
     $   a,
     $   b,
     $   c,
     $   d,
     $   in,
     $   y,
     $   tol,
     $   info)
c
c       lapack_dlagts.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  job
        INTEGER  n
        DOUBLE PRECISION  a(*)
        DOUBLE PRECISION  b(*)
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  d(*)
        INTEGER  in(*)
        DOUBLE PRECISION  y(*)
        DOUBLE PRECISION  tol
        INTEGER  info

        CALL fdlagts(job,
     $   n,
     $   a,
     $   b,
     $   c,
     $   d,
     $   in,
     $   y,
     $   tol,
     $   info)
        RETURN
        END
