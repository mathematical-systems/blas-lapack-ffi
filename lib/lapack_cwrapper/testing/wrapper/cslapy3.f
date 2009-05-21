        REAL FUNCTION cslapy3(x,
     $   y,
     $   z)
c
c       lapack_slapy3.c
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
        REAL  z

        EXTERNAL fslapy3
        CALL fslapy3(cslapy3, x,
     $   y,
     $   z)
        RETURN
        END
