        SUBROUTINE csladiv(a,
     $   b,
     $   c,
     $   d,
     $   p,
     $   q)
c
c       lapack_sladiv.c
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
        REAL  p
        REAL  q

        CALL fsladiv(a,
     $   b,
     $   c,
     $   d,
     $   p,
     $   q)
        RETURN
        END
