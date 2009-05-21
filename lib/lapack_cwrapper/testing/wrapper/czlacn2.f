        SUBROUTINE czlacn2(n,
     $   v,
     $   x,
     $   est,
     $   kase,
     $   isave)
c
c       lapack_zlacn2.c
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
        COMPLEX*16  v(*)
        COMPLEX*16  x(*)
        DOUBLE PRECISION  est
        INTEGER  kase
        INTEGER  isave(*)

        CALL fzlacn2(n,
     $   v,
     $   x,
     $   est,
     $   kase,
     $   isave)
        RETURN
        END
