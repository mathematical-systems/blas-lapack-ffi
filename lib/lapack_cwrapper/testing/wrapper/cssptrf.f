        SUBROUTINE cssptrf(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   info)
c
c       lapack_ssptrf.c
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
        REAL  ap(*)
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fssptrf(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   info)
        RETURN
        END
