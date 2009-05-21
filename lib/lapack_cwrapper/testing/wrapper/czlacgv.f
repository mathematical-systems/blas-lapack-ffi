        SUBROUTINE czlacgv(n,
     $   x,
     $   incx)
c
c       lapack_zlacgv.c
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

        CALL fzlacgv(n,
     $   x,
     $   incx)
        RETURN
        END
