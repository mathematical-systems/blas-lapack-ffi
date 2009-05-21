        SUBROUTINE cslagtm(trans,
     $   n,
     $   nrhs,
     $   alpha,
     $   dl,
     $   d,
     $   du,
     $   x,
     $   ldx,
     $   beta,
     $   b,
     $   ldb)
c
c       lapack_slagtm.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trans
        INTEGER  n
        INTEGER  nrhs
        REAL  alpha
        REAL  dl(*)
        REAL  d(*)
        REAL  du(*)
        REAL  x(*)
        INTEGER  ldx
        REAL  beta
        REAL  b(*)
        INTEGER  ldb

        CALL fslagtm(trans,
     $   n,
     $   nrhs,
     $   alpha,
     $   dl,
     $   d,
     $   du,
     $   x,
     $   ldx,
     $   beta,
     $   b,
     $   ldb)
        RETURN
        END
