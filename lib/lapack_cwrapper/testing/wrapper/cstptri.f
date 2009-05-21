        SUBROUTINE cstptri(uplo,
     $   diag,
     $   n,
     $   ap,
     $   info)
c
c       lapack_stptri.c
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
        CHARACTER  diag
        INTEGER  n
        REAL  ap(*)
        INTEGER  info

        CALL fstptri(uplo,
     $   diag,
     $   n,
     $   ap,
     $   info)
        RETURN
        END
