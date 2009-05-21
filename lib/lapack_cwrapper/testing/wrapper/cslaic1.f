        SUBROUTINE cslaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
c
c       lapack_slaic1.c
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
        REAL  x(*)
        REAL  sest
        REAL  w(*)
        REAL  gamma
        REAL  sestpr
        REAL  s
        REAL  c

        CALL fslaic1(job,
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
