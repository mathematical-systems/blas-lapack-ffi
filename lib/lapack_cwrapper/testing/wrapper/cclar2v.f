        SUBROUTINE cclar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
c
c       lapack_clar2v.c
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
        COMPLEX  x(*)
        COMPLEX  y(*)
        COMPLEX  z(*)
        INTEGER  incx
        REAL  c(*)
        COMPLEX  s(*)
        INTEGER  incc

        CALL fclar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
        RETURN
        END
