        SUBROUTINE ccptsvx(fact,
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
     $   rwork,
     $   info)
c
c       lapack_cptsvx.c
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
        COMPLEX  e(*)
        REAL  df(*)
        COMPLEX  ef(*)
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcptsvx(fact,
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
     $   rwork,
     $   info)
        RETURN
        END
