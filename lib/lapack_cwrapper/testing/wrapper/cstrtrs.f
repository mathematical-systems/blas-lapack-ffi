        SUBROUTINE cstrtrs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_strtrs.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fstrtrs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
