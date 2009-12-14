        REAL FUNCTION cslamc3(a,
     $   b)
c
c       lapack_slamc3.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        REAL  a
        REAL  b

        EXTERNAL fslamc3
        CALL fslamc3(cslamc3, a,
     $   b)
        RETURN
        END
