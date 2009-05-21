        SUBROUTINE cspptrs(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_spptrs.c
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
        REAL  ap(*)
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fspptrs(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
