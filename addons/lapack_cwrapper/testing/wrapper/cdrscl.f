        SUBROUTINE cdrscl(n,
     $   sa,
     $   sx,
     $   incx)
c
c       lapack_drscl.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        DOUBLE PRECISION  sa
        DOUBLE PRECISION  sx(*)
        INTEGER  incx

        CALL fdrscl(n,
     $   sa,
     $   sx,
     $   incx)
        RETURN
        END
