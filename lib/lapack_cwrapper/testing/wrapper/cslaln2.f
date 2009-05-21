        SUBROUTINE cslaln2(ltrans,
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
c       lapack_slaln2.c
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
        REAL  smin
        REAL  ca
        REAL  a(*)
        INTEGER  lda
        REAL  d1
        REAL  d2
        REAL  b(*)
        INTEGER  ldb
        REAL  wr
        REAL  wi
        REAL  x(*)
        INTEGER  ldx
        REAL  scale
        REAL  xnorm
        INTEGER  info

        CALL fslaln2(ltrans,
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
