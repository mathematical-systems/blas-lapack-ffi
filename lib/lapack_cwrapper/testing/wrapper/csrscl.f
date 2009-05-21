        SUBROUTINE csrscl(n,
     $   sa,
     $   sx,
     $   incx)
c
c       lapack_srscl.c
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
        REAL  sa
        REAL  sx(*)
        INTEGER  incx

        CALL fsrscl(n,
     $   sa,
     $   sx,
     $   incx)
        RETURN
        END
