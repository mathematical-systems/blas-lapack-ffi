        SUBROUTINE cclaesy(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   evscal,
     $   cs1,
     $   sn1)
c
c       lapack_claesy.c
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
        COMPLEX  rt1
        COMPLEX  rt2
        COMPLEX  evscal
        COMPLEX  cs1
        COMPLEX  sn1

        CALL fclaesy(a,
     $   b,
     $   c,
     $   rt1,
     $   rt2,
     $   evscal,
     $   cs1,
     $   sn1)
        RETURN
        END
