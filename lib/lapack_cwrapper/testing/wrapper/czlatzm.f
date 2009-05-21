        SUBROUTINE czlatzm(side,
     $   m,
     $   n,
     $   v,
     $   incv,
     $   tau,
     $   c1,
     $   c2,
     $   ldc,
     $   work)
c
c       lapack_zlatzm.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        INTEGER  m
        INTEGER  n
        COMPLEX*16  v(*)
        INTEGER  incv
        COMPLEX*16  tau
        COMPLEX*16  c1(*)
        COMPLEX*16  c2(*)
        INTEGER  ldc
        COMPLEX*16  work(*)

        CALL fzlatzm(side,
     $   m,
     $   n,
     $   v,
     $   incv,
     $   tau,
     $   c1,
     $   c2,
     $   ldc,
     $   work)
        RETURN
        END
