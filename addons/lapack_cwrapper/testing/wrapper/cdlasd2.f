        SUBROUTINE cdlasd2(nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   z,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   dsigma,
     $   u2,
     $   ldu2,
     $   vt2,
     $   ldvt2,
     $   idxp,
     $   idx,
     $   idxc,
     $   idxq,
     $   coltyp,
     $   info)
c
c       lapack_dlasd2.c
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
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  beta
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        DOUBLE PRECISION  dsigma(*)
        DOUBLE PRECISION  u2(*)
        INTEGER  ldu2
        DOUBLE PRECISION  vt2(*)
        INTEGER  ldvt2
        INTEGER  idxp(*)
        INTEGER  idx(*)
        INTEGER  idxc(*)
        INTEGER  idxq(*)
        INTEGER  coltyp(*)
        INTEGER  info

        CALL fdlasd2(nl,
     $   nr,
     $   sqre,
     $   k,
     $   d,
     $   z,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   dsigma,
     $   u2,
     $   ldu2,
     $   vt2,
     $   ldvt2,
     $   idxp,
     $   idx,
     $   idxc,
     $   idxq,
     $   coltyp,
     $   info)
        RETURN
        END
