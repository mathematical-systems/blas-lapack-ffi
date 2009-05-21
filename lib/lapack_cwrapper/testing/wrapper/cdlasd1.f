        SUBROUTINE cdlasd1(nl,
     $   nr,
     $   sqre,
     $   d,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   idxq,
     $   iwork,
     $   work,
     $   info)
c
c       lapack_dlasd1.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  beta
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        INTEGER  idxq(*)
        INTEGER  iwork(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasd1(nl,
     $   nr,
     $   sqre,
     $   d,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   idxq,
     $   iwork,
     $   work,
     $   info)
        RETURN
        END
