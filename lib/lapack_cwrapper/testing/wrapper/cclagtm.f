        SUBROUTINE cclagtm(trans,
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
c       lapack_clagtm.c
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
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  beta
        COMPLEX  b(*)
        INTEGER  ldb

        CALL fclagtm(trans,
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
