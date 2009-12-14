        SUBROUTINE cslargv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   incc)
c
c       lapack_slargv.c
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
        REAL  x(*)
        INTEGER  incx
        REAL  y(*)
        INTEGER  incy
        REAL  c(*)
        INTEGER  incc

        CALL fslargv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   incc)
        RETURN
        END
