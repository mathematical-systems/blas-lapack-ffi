        SUBROUTINE cchptrs(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_chptrs.c
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
        COMPLEX  ap(*)
        INTEGER  ipiv(*)
        COMPLEX  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fchptrs(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
