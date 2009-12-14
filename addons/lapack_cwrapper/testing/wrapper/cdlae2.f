        SUBROUTINE cdlae2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2)
c
c       lapack_dlae2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  a
        DOUBLE PRECISION  b
        DOUBLE PRECISION  c
        DOUBLE PRECISION  rt1
        DOUBLE PRECISION  rt2

        CALL fdlae2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2)
        RETURN
        END
