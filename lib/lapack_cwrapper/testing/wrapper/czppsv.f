        SUBROUTINE czppsv(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_zppsv.c
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
        COMPLEX*16  ap(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzppsv(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
