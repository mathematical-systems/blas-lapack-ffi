        SUBROUTINE cctprfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ctprfs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        CHARACTER  trans
        CHARACTER  diag
        INTEGER  n
        INTEGER  nrhs
        COMPLEX  ap(*)
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fctprfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
