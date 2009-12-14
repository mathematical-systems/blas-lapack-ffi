        SUBROUTINE czlacon(n,
     $   v,
     $   x,
     $   est,
     $   kase)
c
c       lapack_zlacon.c
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

        CALL fzlacon(n,
     $   v,
     $   x,
     $   est,
     $   kase)
        RETURN
        END
