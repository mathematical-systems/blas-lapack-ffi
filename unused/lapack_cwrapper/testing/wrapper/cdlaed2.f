        SUBROUTINE cdlaed2(k,
     $   n,
     $   n1,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   z,
     $   dlamda,
     $   w,
     $   q2,
     $   indx,
     $   indxc,
     $   indxp,
     $   coltyp,
     $   info)
c
c       lapack_dlaed2.c
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
        INTEGER  n1
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        INTEGER  indxq(*)
        DOUBLE PRECISION  rho
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  dlamda(*)
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  q2(*)
        INTEGER  indx(*)
        INTEGER  indxc(*)
        INTEGER  indxp(*)
        INTEGER  coltyp(*)
        INTEGER  info

        CALL fdlaed2(k,
     $   n,
     $   n1,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   z,
     $   dlamda,
     $   w,
     $   q2,
     $   indx,
     $   indxc,
     $   indxp,
     $   coltyp,
     $   info)
        RETURN
        END
