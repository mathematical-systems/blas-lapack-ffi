        SUBROUTINE cdlasd0(n,
     $   sqre,
     $   d,
     $   e,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   smlsiz,
     $   iwork,
     $   work,
     $   info)
c
c       lapack_dlasd0.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  sqre
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        INTEGER  smlsiz
        INTEGER  iwork(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasd0(n,
     $   sqre,
     $   d,
     $   e,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   smlsiz,
     $   iwork,
     $   work,
     $   info)
        RETURN
        END
