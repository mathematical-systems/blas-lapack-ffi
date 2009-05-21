        SUBROUTINE cclaed8(k,
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
c       lapack_claed8.c
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
        COMPLEX  q(*)
        INTEGER  ldq
        REAL  d(*)
        REAL  rho
        INTEGER  cutpnt
        REAL  z(*)
        REAL  dlamda(*)
        COMPLEX  q2(*)
        INTEGER  ldq2
        REAL  w(*)
        INTEGER  indxp(*)
        INTEGER  indx(*)
        INTEGER  indxq(*)
        INTEGER  perm(*)
        INTEGER  givptr
        INTEGER  givcol(*)
        REAL  givnum(*)
        INTEGER  info

        CALL fclaed8(k,
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
