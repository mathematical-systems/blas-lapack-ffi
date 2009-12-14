        DOUBLE PRECISION FUNCTION cdlapy3(x,
     $   y,
     $   z)
c
c       lapack_dlapy3.c
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
        DOUBLE PRECISION  z

        EXTERNAL fdlapy3
        CALL fdlapy3(cdlapy3, x,
     $   y,
     $   z)
        RETURN
        END
