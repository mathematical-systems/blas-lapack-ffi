        SUBROUTINE cdladiv(a,
     $   b,
     $   c,
     $   d,
     $   p,
     $   q)
c
c       lapack_dladiv.c
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
        DOUBLE PRECISION  p
        DOUBLE PRECISION  q

        CALL fdladiv(a,
     $   b,
     $   c,
     $   d,
     $   p,
     $   q)
        RETURN
        END
