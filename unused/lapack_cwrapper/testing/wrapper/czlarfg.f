        SUBROUTINE czlarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
c
c       lapack_zlarfg.c
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
        COMPLEX*16  alpha
        COMPLEX*16  x(*)
        INTEGER  incx
        COMPLEX*16  tau

        CALL fzlarfg(n,
     $   alpha,
     $   x,
     $   incx,
     $   tau)
        RETURN
        END
