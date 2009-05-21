        SUBROUTINE cdlapll(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   ssmin)
c
c       lapack_dlapll.c
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
        DOUBLE PRECISION  ssmin

        CALL fdlapll(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   ssmin)
        RETURN
        END
