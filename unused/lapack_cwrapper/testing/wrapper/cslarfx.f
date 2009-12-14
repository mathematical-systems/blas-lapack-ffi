        SUBROUTINE cslarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
c
c       lapack_slarfx.c
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
        REAL  tau
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)

        CALL fslarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
        RETURN
        END
