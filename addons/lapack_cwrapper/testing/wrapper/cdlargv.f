        SUBROUTINE cdlargv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   incc)
c
c       lapack_dlargv.c
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
        DOUBLE PRECISION  x(*)
        INTEGER  incx
        DOUBLE PRECISION  y(*)
        INTEGER  incy
        DOUBLE PRECISION  c(*)
        INTEGER  incc

        CALL fdlargv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   incc)
        RETURN
        END
