        SUBROUTINE cslaed8(icompq,
     $   k,
     $   n,
     $   qsiz,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   z,
     $   dlamda,
     $   q2,
     $   ldq2,
     $   w,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   indxp,
     $   indx,
     $   info)
c
c       lapack_slaed8.c
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
        INTEGER  k
        INTEGER  n
        INTEGER  qsiz
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        INTEGER  indxq(*)
        REAL  rho
        INTEGER  cutpnt
        REAL  z(*)
        REAL  dlamda(*)
        REAL  q2(*)
        INTEGER  ldq2
        REAL  w(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        REAL  givnum(*)
        INTEGER  indxp(*)
        INTEGER  indx(*)
        INTEGER  info

        CALL fslaed8(icompq,
     $   k,
     $   n,
     $   qsiz,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   z,
     $   dlamda,
     $   q2,
     $   ldq2,
     $   w,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   indxp,
     $   indx,
     $   info)
        RETURN
        END
