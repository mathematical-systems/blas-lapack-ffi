        SUBROUTINE cdsyrfs(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   af,
     $   ldaf,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dsyrfs.c
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
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  af(*)
        INTEGER  ldaf
        INTEGER  ipiv(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdsyrfs(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   af,
     $   ldaf,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
