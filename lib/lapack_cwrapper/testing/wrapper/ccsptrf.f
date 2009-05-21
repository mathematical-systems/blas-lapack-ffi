        SUBROUTINE ccsptrf(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   info)
c
c       lapack_csptrf.c
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
        COMPLEX  ap(*)
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fcsptrf(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   info)
        RETURN
        END
