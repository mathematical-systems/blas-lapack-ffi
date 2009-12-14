        SUBROUTINE cslarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
c
c       lapack_slarfg.c
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
        REAL  alpha
        REAL  x(*)
        INTEGER  incx
        REAL  tau

        CALL fslarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
        RETURN
        END
