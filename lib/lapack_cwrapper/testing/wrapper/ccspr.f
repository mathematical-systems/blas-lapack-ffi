        SUBROUTINE ccspr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   ap)
c
c       lapack_cspr.c
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
        COMPLEX  ap(*)

        CALL fcspr(uplo,
     $   n,
     $   alpha,
     $   x,
     $   incx,
     $   ap)
        RETURN
        END
