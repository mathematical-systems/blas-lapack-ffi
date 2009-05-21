        SUBROUTINE cclals0(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   nrhs,
     $   b,
     $   ldb,
     $   bx,
     $   ldbx,
     $   perm,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   givnum,
     $   ldgnum,
     $   poles,
     $   difl,
     $   difr,
     $   z,
     $   k,
     $   c,
     $   s,
     $   rwork,
     $   info)
c
c       lapack_clals0.c
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
        INTEGER  nl
        INTEGER  nr
        INTEGER  sqre
        INTEGER  nrhs
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  bx(*)
        INTEGER  ldbx
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        INTEGER  ldgcol
        REAL  givnum(*)
        INTEGER  ldgnum
        REAL  poles(*)
        REAL  difl(*)
        REAL  difr(*)
        REAL  z(*)
        INTEGER  k
        REAL  c
        REAL  s
        REAL  rwork(*)
        INTEGER  info

        CALL fclals0(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   nrhs,
     $   b,
     $   ldb,
     $   bx,
     $   ldbx,
     $   perm,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   givnum,
     $   ldgnum,
     $   poles,
     $   difl,
     $   difr,
     $   z,
     $   k,
     $   c,
     $   s,
     $   rwork,
     $   info)
        RETURN
        END
