        SUBROUTINE czlartv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   s,
     $   incc)
c
c       lapack_zlartv.c
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
        COMPLEX*16  x(*)
        INTEGER  incx
        COMPLEX*16  y(*)
        INTEGER  incy
        DOUBLE PRECISION  c(*)
        COMPLEX*16  s(*)
        INTEGER  incc

        CALL fzlartv(n,
     $   x,
     $   incx,
     $   y,
     $   incy,
     $   c,
     $   s,
     $   incc)
        RETURN
        END
