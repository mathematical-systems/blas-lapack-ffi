        SUBROUTINE cclapll(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   ssmin)
c
c       lapack_clapll.c
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
        COMPLEX  x(*)
        INTEGER  incx
        COMPLEX  y(*)
        INTEGER  incy
        REAL  ssmin

        CALL fclapll(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   ssmin)
        RETURN
        END
