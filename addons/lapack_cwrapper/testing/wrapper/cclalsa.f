        SUBROUTINE cclalsa(icompq,
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
c       lapack_clalsa.c
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
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  bx(*)
        INTEGER  ldbx
        REAL  u(*)
        INTEGER  ldu
        REAL  vt(*)
        INTEGER  k(*)
        REAL  difl(*)
        REAL  difr(*)
        REAL  z(*)
        REAL  poles(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        INTEGER  ldgcol
        INTEGER  perm(*)
        REAL  givnum(*)
        REAL  c(*)
        REAL  s(*)
        REAL  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fclalsa(icompq,
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
