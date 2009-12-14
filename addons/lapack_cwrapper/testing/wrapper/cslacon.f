        SUBROUTINE cslacon(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase)
c
c       lapack_slacon.c
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
        REAL  v(*)
        REAL  x(*)
        INTEGER  isgn(*)
        REAL  est
        INTEGER  kase

        CALL fslacon(n,
     $   v,
     $   x,
     $   isgn,
     $   est,
     $   kase)
        RETURN
        END
