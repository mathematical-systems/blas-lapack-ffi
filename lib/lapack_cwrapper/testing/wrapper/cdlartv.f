        SUBROUTINE cdlartv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   s,
     $   incc)
c
c       lapack_dlartv.c
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
        DOUBLE PRECISION  s(*)
        INTEGER  incc

        CALL fdlartv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   s,
     $   incc)
        RETURN
        END
