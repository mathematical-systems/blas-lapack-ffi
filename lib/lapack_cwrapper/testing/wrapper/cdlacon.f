        SUBROUTINE cdlacon(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase)
c
c       lapack_dlacon.c
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

        CALL fdlacon(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase)
        RETURN
        END
