        SUBROUTINE ccsptri(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   work,
     $   info)
c
c       lapack_csptri.c
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
        COMPLEX  work(*)
        INTEGER  info

        CALL fcsptri(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   work,
     $   info)
        RETURN
        END
