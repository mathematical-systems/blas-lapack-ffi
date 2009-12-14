        SUBROUTINE czlar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
c
c       lapack_zlar2v.c
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
        COMPLEX*16  x(*)
        COMPLEX*16  y(*)
        COMPLEX*16  z(*)
        INTEGER  incx
        DOUBLE PRECISION  c(*)
        COMPLEX*16  s(*)
        INTEGER  incc

        CALL fzlar2v(n,
     $   x,
     $   y,
     $   z,
     $   incx,
     $   c,
     $   s,
     $   incc)
        RETURN
        END
