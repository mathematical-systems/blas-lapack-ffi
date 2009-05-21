        SUBROUTINE cclacrt(n,
     $   cx,
     $   incx,
     $   cy,
     $   incy,
     $   c,
     $   s)
c
c       lapack_clacrt.c
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
        COMPLEX  cx(*)
        INTEGER  incx
        COMPLEX  cy(*)
        INTEGER  incy
        COMPLEX  c
        COMPLEX  s

        CALL fclacrt(n,
     $   cx,
     $   incx,
     $   cy,
     $   incy,
     $   c,
     $   s)
        RETURN
        END
