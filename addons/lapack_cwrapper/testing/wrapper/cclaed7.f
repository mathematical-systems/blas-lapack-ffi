        SUBROUTINE cclaed7(n,
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
c       lapack_claed7.c
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
        REAL  d(*)
        COMPLEX  q(*)
        INTEGER  ldq
        REAL  rho
        INTEGER  indxq(*)
        INTEGER  iwork(*)
        REAL  rwork(*)
        COMPLEX  work(*)
        REAL  qstore(*)
        INTEGER  qptr(*)
        INTEGER  prmptr(*)
        INTEGER  perm(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        REAL  givnum(*)
        INTEGER  info

        CALL fclaed7(n,
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
