        SUBROUTINE czlaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
c
c       lapack_zlaev2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX*16  a
        COMPLEX*16  b
        COMPLEX*16  c
        DOUBLE PRECISION  rt1
        DOUBLE PRECISION  rt2
        DOUBLE PRECISION  cs1
        COMPLEX*16  sn1

        CALL fzlaev2(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   cs1,
     $   sn1)
        RETURN
        END
