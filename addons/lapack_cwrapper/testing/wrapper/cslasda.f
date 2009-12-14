        SUBROUTINE cslasda(icompq,
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
c       lapack_slasda.c
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
        REAL  d(*)
        REAL  e(*)
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
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslasda(icompq,
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
