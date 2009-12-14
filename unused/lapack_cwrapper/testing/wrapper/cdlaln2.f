        SUBROUTINE cdlaln2(ltrans,
     $   na,
     $   nw,
     $   smin,
     $   ca,
     $   a,
     $   lda,
     $   d1,
     $   d2,
     $   b,
     $   ldb,
     $   wr,
     $   wi,
     $   x,
     $   ldx,
     $   scale,
     $   xnorm,
     $   info)
c
c       lapack_dlaln2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  ltrans
        INTEGER  na
        INTEGER  nw
        DOUBLE PRECISION  smin
        DOUBLE PRECISION  ca
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d1
        DOUBLE PRECISION  d2
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  wr
        DOUBLE PRECISION  wi
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  xnorm
        INTEGER  info

        CALL fdlaln2(ltrans,
     $   na,
     $   nw,
     $   smin,
     $   ca,
     $   a,
     $   lda,
     $   d1,
     $   d2,
     $   b,
     $   ldb,
     $   wr,
     $   wi,
     $   x,
     $   ldx,
     $   scale,
     $   xnorm,
     $   info)
        RETURN
        END
