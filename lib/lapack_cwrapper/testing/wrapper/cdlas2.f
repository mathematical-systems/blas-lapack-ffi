        SUBROUTINE cdlas2(f,
     $   g,
     $   h,
     $   ssmin,
     $   ssmax)
c
c       lapack_dlas2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  f
        DOUBLE PRECISION  g
        DOUBLE PRECISION  h
        DOUBLE PRECISION  ssmin
        DOUBLE PRECISION  ssmax

        CALL fdlas2(f,
     $   g,
     $   h,
     $   ssmin,
     $   ssmax)
        RETURN
        END
