        SUBROUTINE czlaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
c
c       lapack_zlaic1.c
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
        COMPLEX*16  x(*)
        DOUBLE PRECISION  sest
        COMPLEX*16  w(*)
        COMPLEX*16  gamma
        DOUBLE PRECISION  sestpr
        COMPLEX*16  s
        COMPLEX*16  c

        CALL fzlaic1(job,
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
