        SUBROUTINE czhptri(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   work,
     $   info)
c
c       lapack_zhptri.c
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
        INTEGER  ipiv(*)
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzhptri(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   work,
     $   info)
        RETURN
        END
