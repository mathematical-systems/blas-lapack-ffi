        SUBROUTINE cslaed7(icompq,
     $   n,
     $   qsiz,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   qstore,
     $   qptr,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_slaed7.c
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
        INTEGER  n
        INTEGER  qsiz
        INTEGER  tlvls
        INTEGER  curlvl
        INTEGER  curpbm
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        INTEGER  indxq(*)
        REAL  rho
        INTEGER  cutpnt
        REAL  qstore(*)
        INTEGER  qptr(*)
        INTEGER  prmptr(*)
        INTEGER  perm(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        REAL  givnum(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslaed7(icompq,
     $   n,
     $   qsiz,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   qstore,
     $   qptr,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
