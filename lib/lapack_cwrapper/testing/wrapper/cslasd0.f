        SUBROUTINE cslasd0(n,
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
c       lapack_slasd0.c
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
        REAL  d(*)
        REAL  e(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  vt(*)
        INTEGER  ldvt
        INTEGER  smlsiz
        INTEGER  iwork(*)
        REAL  work(*)
        INTEGER  info

        CALL fslasd0(n,
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
