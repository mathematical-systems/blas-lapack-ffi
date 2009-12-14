        SUBROUTINE cdlasda(icompq,
     $   smlsiz,
     $   n,
     $   sqre,
     $   d,
     $   e,
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
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dlasda.c
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
        INTEGER  sqre
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
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
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlasda(icompq,
     $   smlsiz,
     $   n,
     $   sqre,
     $   d,
     $   e,
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
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
