        SUBROUTINE cdlals0(icompq,
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
     $   work,
     $   info)
c
c       lapack_dlals0.c
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
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  bx(*)
        INTEGER  ldbx
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        INTEGER  ldgcol
        DOUBLE PRECISION  givnum(*)
        INTEGER  ldgnum
        DOUBLE PRECISION  poles(*)
        DOUBLE PRECISION  difl(*)
        DOUBLE PRECISION  difr(*)
        DOUBLE PRECISION  z(*)
        INTEGER  k
        DOUBLE PRECISION  c
        DOUBLE PRECISION  s
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlals0(icompq,
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
     $   work,
     $   info)
        RETURN
        END
