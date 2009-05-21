        SUBROUTINE cdlasd7(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   z,
     $   zw,
     $   vf,
     $   vfw,
     $   vl,
     $   vlw,
     $   alpha,
     $   beta,
     $   dsigma,
     $   idx,
     $   idxp,
     $   idxq,
     $   perm,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   givnum,
     $   ldgnum,
     $   c,
     $   s,
     $   info)
c
c       lapack_dlasd7.c
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
        INTEGER  k
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  zw(*)
        DOUBLE PRECISION  vf(*)
        DOUBLE PRECISION  vfw(*)
        DOUBLE PRECISION  vl(*)
        DOUBLE PRECISION  vlw(*)
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  beta
        DOUBLE PRECISION  dsigma(*)
        INTEGER  idx(*)
        INTEGER  idxp(*)
        INTEGER  idxq(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        INTEGER  ldgcol
        DOUBLE PRECISION  givnum(*)
        INTEGER  ldgnum
        DOUBLE PRECISION  c
        DOUBLE PRECISION  s
        INTEGER  info

        CALL fdlasd7(icompq,
     $   nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   z,
     $   zw,
     $   vf,
     $   vfw,
     $   vl,
     $   vlw,
     $   alpha,
     $   beta,
     $   dsigma,
     $   idx,
     $   idxp,
     $   idxq,
     $   perm,
     $   givptr,
     $   givcol,
     $   ldgcol,
     $   givnum,
     $   ldgnum,
     $   c,
     $   s,
     $   info)
        RETURN
        END
