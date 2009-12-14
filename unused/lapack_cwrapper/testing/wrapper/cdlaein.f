        SUBROUTINE cdlaein(rightv,
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
c       lapack_dlaein.c
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
        DOUBLE PRECISION  h(*)
        INTEGER  ldh
        DOUBLE PRECISION  wr
        DOUBLE PRECISION  wi
        DOUBLE PRECISION  vr(*)
        DOUBLE PRECISION  vi(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  work(*)
        DOUBLE PRECISION  eps3
        DOUBLE PRECISION  smlnum
        DOUBLE PRECISION  bignum
        INTEGER  info

        CALL fdlaein(rightv,
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
