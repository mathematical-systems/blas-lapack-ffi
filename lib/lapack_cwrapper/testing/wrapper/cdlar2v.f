        SUBROUTINE cdlar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
c
c       lapack_dlar2v.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  y(*)
        DOUBLE PRECISION  z(*)
        INTEGER  incx
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  s(*)
        INTEGER  incc

        CALL fdlar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
        RETURN
        END
