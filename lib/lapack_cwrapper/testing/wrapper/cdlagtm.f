        SUBROUTINE cdlagtm(trans,
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
c       lapack_dlagtm.c
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
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  beta
        DOUBLE PRECISION  b(*)
        INTEGER  ldb

        CALL fdlagtm(trans,
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
