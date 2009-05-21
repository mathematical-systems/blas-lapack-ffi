        SUBROUTINE cslasd6(icompq,
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
c       lapack_slasd6.c
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
        REAL  d(*)
        REAL  vf(*)
        REAL  vl(*)
        REAL  alpha
        REAL  beta
        INTEGER  idxq(*)
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
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslasd6(icompq,
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
