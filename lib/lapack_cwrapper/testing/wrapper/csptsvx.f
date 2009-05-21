        SUBROUTINE csptsvx(fact,
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
c       lapack_sptsvx.c
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
        REAL  d(*)
        REAL  e(*)
        REAL  df(*)
        REAL  ef(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        REAL  work(*)
        INTEGER  info

        CALL fsptsvx(fact,
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
