        SUBROUTINE cclaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
c
c       lapack_claev2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX  a
        COMPLEX  b
        COMPLEX  c
        REAL  rt1
        REAL  rt2
        REAL  cs1
        COMPLEX  sn1

        CALL fclaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
        RETURN
        END
