        SUBROUTINE cdlasd6(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   d,
     $   vf,
     $   vl,
     $   alpha,
     $   beta,
     $   idxq,
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
     $   iwork,
     $   info)
c
c       lapack_dlasd6.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  vf(*)
        DOUBLE PRECISION  vl(*)
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  beta
        INTEGER  idxq(*)
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
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlasd6(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   d,
     $   vf,
     $   vl,
     $   alpha,
     $   beta,
     $   idxq,
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
     $   iwork,
     $   info)
        RETURN
        END
