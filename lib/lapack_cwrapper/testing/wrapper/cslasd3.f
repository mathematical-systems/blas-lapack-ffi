        SUBROUTINE cslasd3(nl,
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
c       lapack_slasd3.c
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
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  dsigma(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  u2(*)
        INTEGER  ldu2
        REAL  vt(*)
        INTEGER  ldvt
        REAL  vt2(*)
        INTEGER  ldvt2
        INTEGER  idxc(*)
        INTEGER  ctot(*)
        REAL  z(*)
        INTEGER  info

        CALL fslasd3(nl,
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
