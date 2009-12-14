        SUBROUTINE czptsvx(fact,
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
c       lapack_zptsvx.c
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
        COMPLEX*16  e(*)
        DOUBLE PRECISION  df(*)
        COMPLEX*16  ef(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzptsvx(fact,
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
