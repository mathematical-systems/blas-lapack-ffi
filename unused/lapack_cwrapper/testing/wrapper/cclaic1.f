        SUBROUTINE cclaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
c
c       lapack_claic1.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  job
        INTEGER  j
        COMPLEX  x(*)
        REAL  sest
        COMPLEX  w(*)
        COMPLEX  gamma
        REAL  sestpr
        COMPLEX  s
        COMPLEX  c

        CALL fclaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
        RETURN
        END
