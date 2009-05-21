        SUBROUTINE cdlarnv(idist,
     $   iseed,
     $   n,
     $   x)
c
c       lapack_dlarnv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  idist
        INTEGER  iseed(*)
        INTEGER  n
        DOUBLE PRECISION  x(*)

        CALL fdlarnv(idist,
     $   iseed,
     $   n,
     $   x)
        RETURN
        END
