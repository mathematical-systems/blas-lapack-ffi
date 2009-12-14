        SUBROUTINE cdlaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
c
c       lapack_dlaev2.c
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
        DOUBLE PRECISION  cs1
        DOUBLE PRECISION  sn1

        CALL fdlaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
        RETURN
        END
