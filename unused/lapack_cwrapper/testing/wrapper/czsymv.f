        SUBROUTINE czsymv(uplo,
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
c       lapack_zsymv.c
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
        COMPLEX*16  alpha
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  x(*)
        INTEGER  incx
        COMPLEX*16  beta
        COMPLEX*16  y(*)
        INTEGER  incy

        CALL fzsymv(uplo,
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
