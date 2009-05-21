        SUBROUTINE czlarz(side,
     $   m,
     $   n,
     $   l,
     $   v,
     $   incv,
     $   tau,
     $   c,
     $   ldc,
     $   work)
c
c       lapack_zlarz.c
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
        INTEGER  l
        COMPLEX*16  v(*)
        INTEGER  incv
        COMPLEX*16  tau
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)

        CALL fzlarz(side,
     $   m,
     $   n,
     $   l,
     $   v,
     $   incv,
     $   tau,
     $   c,
     $   ldc,
     $   work)
        RETURN
        END
