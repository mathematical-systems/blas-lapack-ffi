        SUBROUTINE czpttrs(uplo,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_zpttrs.c
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
        DOUBLE PRECISION  d(*)
        COMPLEX*16  e(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzpttrs(uplo,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
