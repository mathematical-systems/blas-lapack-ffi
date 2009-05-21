        SUBROUTINE cchptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
c
c       lapack_chptrd.c
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
        REAL  d(*)
        REAL  e(*)
        COMPLEX  tau(*)
        INTEGER  info

        CALL fchptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
        RETURN
        END
