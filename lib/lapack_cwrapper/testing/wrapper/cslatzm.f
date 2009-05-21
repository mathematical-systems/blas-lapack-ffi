        SUBROUTINE cslatzm(side,
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
c       lapack_slatzm.c
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
        REAL  v(*)
        INTEGER  incv
        REAL  tau
        REAL  c1(*)
        REAL  c2(*)
        INTEGER  ldc
        REAL  work(*)

        CALL fslatzm(side,
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
