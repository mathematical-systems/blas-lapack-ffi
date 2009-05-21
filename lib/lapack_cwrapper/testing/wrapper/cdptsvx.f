        SUBROUTINE cdptsvx(fact,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   df,
     $   ef,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   info)
c
c       lapack_dptsvx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  fact
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  df(*)
        DOUBLE PRECISION  ef(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdptsvx(fact,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   df,
     $   ef,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   info)
        RETURN
        END
