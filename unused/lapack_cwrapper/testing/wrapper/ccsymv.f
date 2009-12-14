        SUBROUTINE ccsymv(uplo,
     $   n,
     $   alpha,
     $   a,
     $   lda,
     $   x,
     $   incx,
     $   beta,
     $   y,
     $   incy)
c
c       lapack_csymv.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  x(*)
        INTEGER  incx
        COMPLEX  beta
        COMPLEX  y(*)
        INTEGER  incy

        CALL fcsymv(uplo,
     $   n,
     $   alpha,
     $   a,
     $   lda,
     $   x,
     $   incx,
     $   beta,
     $   y,
     $   incy)
        RETURN
        END
