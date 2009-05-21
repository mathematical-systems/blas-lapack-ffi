        SUBROUTINE cdlanv2(a,
     $   b,
     $   c,
     $   d,
     $   rt1r,
     $   rt1i,
     $   rt2r,
     $   rt2i,
     $   cs,
     $   sn)
c
c       lapack_dlanv2.c
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
        DOUBLE PRECISION  d
        DOUBLE PRECISION  rt1r
        DOUBLE PRECISION  rt1i
        DOUBLE PRECISION  rt2r
        DOUBLE PRECISION  rt2i
        DOUBLE PRECISION  cs
        DOUBLE PRECISION  sn

        CALL fdlanv2(a,
     $   b,
     $   c,
     $   d,
     $   rt1r,
     $   rt1i,
     $   rt2r,
     $   rt2i,
     $   cs,
     $   sn)
        RETURN
        END
