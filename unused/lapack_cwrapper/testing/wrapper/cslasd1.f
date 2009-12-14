        SUBROUTINE cslasd1(nl,
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
c       lapack_slasd1.c
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
        REAL  d(*)
        REAL  alpha
        REAL  beta
        REAL  u(*)
        INTEGER  ldu
        REAL  vt(*)
        INTEGER  ldvt
        INTEGER  idxq(*)
        INTEGER  iwork(*)
        REAL  work(*)
        INTEGER  info

        CALL fslasd1(nl,
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
