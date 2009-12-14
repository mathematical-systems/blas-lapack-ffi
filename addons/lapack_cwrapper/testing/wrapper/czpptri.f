        SUBROUTINE czpptri(uplo,
     $   n,
     $   ap,
     $   info)
c
c       lapack_zpptri.c
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
        COMPLEX*16  ap(*)
        INTEGER  info

        CALL fzpptri(uplo,
     $   n,
     $   ap,
     $   info)
        RETURN
        END
