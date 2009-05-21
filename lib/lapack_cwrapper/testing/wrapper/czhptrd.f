        SUBROUTINE czhptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
c
c       lapack_zhptrd.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  tau(*)
        INTEGER  info

        CALL fzhptrd(uplo,
     $   n,
     $   ap,
     $   d,
     $   e,
     $   tau,
     $   info)
        RETURN
        END
