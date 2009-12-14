        REAL FUNCTION cslapy2(x,
     $   y)
c
c       lapack_slapy2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        REAL  x
        REAL  y

        EXTERNAL fslapy2
        CALL fslapy2(cslapy2, x,
     $   y)
        RETURN
        END
