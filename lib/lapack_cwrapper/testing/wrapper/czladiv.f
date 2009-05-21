        DOUBLE PRECISION FUNCTION czladiv(x,
     $   y)
c
c       lapack_zladiv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX*16  x
        COMPLEX*16  y

        EXTERNAL fzladiv
        CALL fzladiv(czladiv, x,
     $   y)
        RETURN
        END
