        SUBROUTINE czspr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   ap)
c
c       lapack_zspr.c
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
        COMPLEX*16  x(*)
        INTEGER  incx
        COMPLEX*16  ap(*)

        CALL fzspr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   ap)
        RETURN
        END
