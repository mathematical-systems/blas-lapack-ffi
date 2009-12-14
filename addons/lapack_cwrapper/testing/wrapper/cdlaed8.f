        SUBROUTINE cdlaed8(icompq,
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
c       lapack_dlaed8.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        INTEGER  indxq(*)
        DOUBLE PRECISION  rho
        INTEGER  cutpnt
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  dlamda(*)
        DOUBLE PRECISION  q2(*)
        INTEGER  ldq2
        DOUBLE PRECISION  w(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        DOUBLE PRECISION  givnum(*)
        INTEGER  indxp(*)
        INTEGER  indx(*)
        INTEGER  info

        CALL fdlaed8(icompq,
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
