        SUBROUTINE czdrot(n,
     $   cx,
     $   incx,
     $   cy,
     $   incy,
     $   c,
     $   s)
c
c       lapack_zdrot.c
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
        COMPLEX*16  cx(*)
        INTEGER  incx
        COMPLEX*16  cy(*)
        INTEGER  incy
        DOUBLE PRECISION  c
        DOUBLE PRECISION  s

        CALL fzdrot(n,
     $   cx,
     $   incx,
     $   cy,
     $   incy,
     $   c,
     $   s)
        RETURN
        END
