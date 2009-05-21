        SUBROUTINE cslasd7(icompq,
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
c       lapack_slasd7.c
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
        REAL  d(*)
        REAL  z(*)
        REAL  zw(*)
        REAL  vf(*)
        REAL  vfw(*)
        REAL  vl(*)
        REAL  vlw(*)
        REAL  alpha
        REAL  beta
        REAL  dsigma(*)
        INTEGER  idx(*)
        INTEGER  idxp(*)
        INTEGER  idxq(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        INTEGER  ldgcol
        REAL  givnum(*)
        INTEGER  ldgnum
        REAL  c
        REAL  s
        INTEGER  info

        CALL fslasd7(icompq,
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
