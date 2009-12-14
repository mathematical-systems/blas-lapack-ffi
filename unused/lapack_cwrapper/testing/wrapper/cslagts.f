        SUBROUTINE cslagts(job,
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
c       lapack_slagts.c
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
        REAL  a(*)
        REAL  b(*)
        REAL  c(*)
        REAL  d(*)
        INTEGER  in(*)
        REAL  y(*)
        REAL  tol
        INTEGER  info

        CALL fslagts(job,
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
