        SUBROUTINE czppsvx(fact,
     $   uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   afp,
     $   equed,
     $   s,
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
c       lapack_zppsvx.c
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
        CHARACTER  uplo
        INTEGER  n
        INTEGER  nrhs
        COMPLEX*16  ap(*)
        COMPLEX*16  afp(*)
        CHARACTER  equed
        DOUBLE PRECISION  s(*)
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

        CALL fzppsvx(fact,
     $   uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   afp,
     $   equed,
     $   s,
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
