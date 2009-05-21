        COMPLEX FUNCTION ccladiv(x,
     $   y)
c
c       lapack_cladiv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX  x
        COMPLEX  y

        EXTERNAL fcladiv
        CALL fcladiv(ccladiv, x,
     $   y)
        RETURN
        END
