        SUBROUTINE ccspmv(uplo,
     $   n,
     $   alpha,
     $   ap,
     $   x,
     $   incx,
     $   beta,
     $   y,
     $   incy)
c
c       lapack_cspmv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  n
        COMPLEX  alpha
        COMPLEX  ap(*)
        COMPLEX  x(*)
        INTEGER  incx
        COMPLEX  beta
        COMPLEX  y(*)
        INTEGER  incy

        CALL fcspmv(uplo,
     $   n,
     $   alpha,
     $   ap,
     $   x,
     $   incx,
     $   beta,
     $   y,
     $   incy)
        RETURN
        END
