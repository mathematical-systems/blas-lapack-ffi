        SUBROUTINE cdsptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
c
c       lapack_dsptrd.c
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
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  tau(*)
        INTEGER  info

        CALL fdsptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
        RETURN
        END
