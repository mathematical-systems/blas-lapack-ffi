        SUBROUTINE csgtrfs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   dlf,
     $   df,
     $   duf,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_sgtrfs.c
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
        REAL  dl(*)
        REAL  d(*)
        REAL  du(*)
        REAL  dlf(*)
        REAL  df(*)
        REAL  duf(*)
        REAL  du2(*)
        INTEGER  ipiv(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  x(*)
        INTEGER  ldx
        REAL  ferr(*)
        REAL  berr(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgtrfs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   dlf,
     $   df,
     $   duf,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
