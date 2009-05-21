        SUBROUTINE cdlarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
c
c       lapack_dlarfg.c
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
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  x(*)
        INTEGER  incx
        DOUBLE PRECISION  tau

        CALL fdlarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
        RETURN
        END
