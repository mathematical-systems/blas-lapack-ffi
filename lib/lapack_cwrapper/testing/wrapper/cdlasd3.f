        SUBROUTINE cdlasd3(nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   q,
     $   ldq,
     $   dsigma,
     $   u,
     $   ldu,
     $   u2,
     $   ldu2,
     $   vt,
     $   ldvt,
     $   vt2,
     $   ldvt2,
     $   idxc,
     $   ctot,
     $   z,
     $   info)
c
c       lapack_dlasd3.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  nl
        INTEGER  nr
        INTEGER  sqre
        INTEGER  k
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  dsigma(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  u2(*)
        INTEGER  ldu2
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        DOUBLE PRECISION  vt2(*)
        INTEGER  ldvt2
        INTEGER  idxc(*)
        INTEGER  ctot(*)
        DOUBLE PRECISION  z(*)
        INTEGER  info

        CALL fdlasd3(nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   q,
     $   ldq,
     $   dsigma,
     $   u,
     $   ldu,
     $   u2,
     $   ldu2,
     $   vt,
     $   ldvt,
     $   vt2,
     $   ldvt2,
     $   idxc,
     $   ctot,
     $   z,
     $   info)
        RETURN
        END
