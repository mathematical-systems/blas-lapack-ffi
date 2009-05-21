        SUBROUTINE czlaed7(n,
     $   cutpnt,
     $   qsiz,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   indxq,
     $   iwork,
     $   rwork,
     $   work,
     $   qstore,
     $   qptr,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   info)
c
c       lapack_zlaed7.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  cutpnt
        INTEGER  qsiz
        INTEGER  tlvls
        INTEGER  curlvl
        INTEGER  curpbm
        DOUBLE PRECISION  d(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  rho
        INTEGER  indxq(*)
        INTEGER  iwork(*)
        DOUBLE PRECISION  rwork(*)
        COMPLEX*16  work(*)
        DOUBLE PRECISION  qstore(*)
        INTEGER  qptr(*)
        INTEGER  prmptr(*)
        INTEGER  perm(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        DOUBLE PRECISION  givnum(*)
        INTEGER  info

        CALL fzlaed7(n,
     $   cutpnt,
     $   qsiz,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   indxq,
     $   iwork,
     $   rwork,
     $   work,
     $   qstore,
     $   qptr,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   info)
        RETURN
        END
