        SUBROUTINE cslanv2(a,
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
c       lapack_slanv2.c
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
        REAL  c
        REAL  d
        REAL  rt1r
        REAL  rt1i
        REAL  rt2r
        REAL  rt2i
        REAL  cs
        REAL  sn

        CALL fslanv2(a,
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
