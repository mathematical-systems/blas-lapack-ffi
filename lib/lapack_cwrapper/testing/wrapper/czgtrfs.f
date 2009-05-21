        SUBROUTINE czgtrfs(trans,
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
     $   rwork,
     $   info)
c
c       lapack_zgtrfs.c
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
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)
        COMPLEX*16  dlf(*)
        COMPLEX*16  df(*)
        COMPLEX*16  duf(*)
        COMPLEX*16  du2(*)
        INTEGER  ipiv(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzgtrfs(trans,
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
     $   rwork,
     $   info)
        RETURN
        END
