        SUBROUTINE czlalsa(icompq,
     $   smlsiz,
     $   n,
     $   nrhs,
     $   b,
     $   ldb,
     $   bx,
     $   ldbx,
     $   u,
     $   ldu,
     $   vt,
     $   k,
     $   difl,
     $   difr,
     $   z,
     $   poles,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   perm,
     $   givnum,
     $   c,
     $   s,
     $   rwork,
     $   iwork,
     $   info)
c
c       lapack_zlalsa.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  icompq
        INTEGER  smlsiz
        INTEGER  n
        INTEGER  nrhs
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  bx(*)
        INTEGER  ldbx
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  k(*)
        DOUBLE PRECISION  difl(*)
        DOUBLE PRECISION  difr(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  poles(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        INTEGER  ldgcol
        INTEGER  perm(*)
        DOUBLE PRECISION  givnum(*)
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fzlalsa(icompq,
     $   smlsiz,
     $   n,
     $   nrhs,
     $   b,
     $   ldb,
     $   bx,
     $   ldbx,
     $   u,
     $   ldu,
     $   vt,
     $   k,
     $   difl,
     $   difr,
     $   z,
     $   poles,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   perm,
     $   givnum,
     $   c,
     $   s,
     $   rwork,
     $   iwork,
     $   info)
        RETURN
        END
