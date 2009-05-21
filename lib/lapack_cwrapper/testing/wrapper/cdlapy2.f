        DOUBLE PRECISION FUNCTION cdlapy2(x,
     $   y)
c
c       lapack_dlapy2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  x
        DOUBLE PRECISION  y

        EXTERNAL fdlapy2
        CALL fdlapy2(cdlapy2, x,
     $   y)
        RETURN
        END
