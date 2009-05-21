        SUBROUTINE cclarf(side,
     $   m,
     $   n,
     $   v,
     $   incv,
     $   tau,
     $   c,
     $   ldc,
     $   work)
c
c       lapack_clarf.c
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
        COMPLEX  v(*)
        INTEGER  incv
        COMPLEX  tau
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  work(*)

        CALL fclarf(side,
     $   m,
     $   n,
     $   v,
     $   incv,
     $   tau,
     $   c,
     $   ldc,
     $   work)
        RETURN
        END
