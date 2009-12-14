        SUBROUTINE czlaed8(k,
     $   n,
     $   qsiz,
     $   q,
     $   ldq,
     $   d,
     $   rho,
     $   cutpnt,
     $   z,
     $   dlamda,
     $   q2,
     $   ldq2,
     $   w,
     $   indxp,
     $   indx,
     $   indxq,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   info)
c
c       lapack_zlaed8.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  k
        INTEGER  n
        INTEGER  qsiz
        COMPLEX*16  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  rho
        INTEGER  cutpnt
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  dlamda(*)
        COMPLEX*16  q2(*)
        INTEGER  ldq2
        DOUBLE PRECISION  w(*)
        INTEGER  indxp(*)
        INTEGER  indx(*)
        INTEGER  indxq(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        DOUBLE PRECISION  givnum(*)
        INTEGER  info

        CALL fzlaed8(k,
     $   n,
     $   qsiz,
     $   q,
     $   ldq,
     $   d,
     $   rho,
     $   cutpnt,
     $   z,
     $   dlamda,
     $   q2,
     $   ldq2,
     $   w,
     $   indxp,
     $   indx,
     $   indxq,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   info)
        RETURN
        END
