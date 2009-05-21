        SUBROUTINE czlaesy(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   evscal,
     $   cs1,
     $   sn1)
c
c       lapack_zlaesy.c
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
        COMPLEX*16  rt1
        COMPLEX*16  rt2
        COMPLEX*16  evscal
        COMPLEX*16  cs1
        COMPLEX*16  sn1

        CALL fzlaesy(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   evscal,
     $   cs1,
     $   sn1)
        RETURN
        END
