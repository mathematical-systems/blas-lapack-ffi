        SUBROUTINE cslaein(rightv,
     $   noinit,
     $   n,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   vr,
     $   vi,
     $   b,
     $   ldb,
     $   work,
     $   eps3,
     $   smlnum,
     $   bignum,
     $   info)
c
c       lapack_slaein.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  rightv
        LOGICAL  noinit
        INTEGER  n
        REAL  h(*)
        INTEGER  ldh
        REAL  wr
        REAL  wi
        REAL  vr(*)
        REAL  vi(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  work(*)
        REAL  eps3
        REAL  smlnum
        REAL  bignum
        INTEGER  info

        CALL fslaein(rightv,
     $   noinit,
     $   n,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   vr,
     $   vi,
     $   b,
     $   ldb,
     $   work,
     $   eps3,
     $   smlnum,
     $   bignum,
     $   info)
        RETURN
        END
