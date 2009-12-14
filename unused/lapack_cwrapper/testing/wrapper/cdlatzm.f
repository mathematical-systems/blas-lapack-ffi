        SUBROUTINE cdlatzm(side,
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
c       lapack_dlatzm.c
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
        DOUBLE PRECISION  v(*)
        INTEGER  incv
        DOUBLE PRECISION  tau
        DOUBLE PRECISION  c1(*)
        DOUBLE PRECISION  c2(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)

        CALL fdlatzm(side,
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
