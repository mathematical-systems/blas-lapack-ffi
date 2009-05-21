        SUBROUTINE cdlarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
c
c       lapack_dlarfx.c
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
        DOUBLE PRECISION  tau
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)

        CALL fdlarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
        RETURN
        END
