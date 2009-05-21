        SUBROUTINE cdlacn2(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase,
     $   isave)
c
c       lapack_dlacn2.c
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
        DOUBLE PRECISION  v(*)
        DOUBLE PRECISION  x(*)
        INTEGER  isgn(*)
        DOUBLE PRECISION  est
        INTEGER  kase
        INTEGER  isave(*)

        CALL fdlacn2(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase,
     $   isave)
        RETURN
        END
