        SUBROUTINE ccsyr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   a,
     $   lda)
c
c       lapack_csyr.c
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
        COMPLEX  x(*)
        INTEGER  incx
        COMPLEX  a(*)
        INTEGER  lda

        CALL fcsyr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   a,
     $   lda)
        RETURN
        END
