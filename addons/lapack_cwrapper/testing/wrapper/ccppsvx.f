        SUBROUTINE ccppsvx(fact,
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
c       lapack_cppsvx.c
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
        COMPLEX  ap(*)
        COMPLEX  afp(*)
        CHARACTER  equed
        REAL  s(*)
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

        CALL fcppsvx(fact,
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
