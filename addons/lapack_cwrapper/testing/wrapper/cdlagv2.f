        SUBROUTINE cdlagv2(a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   csl,
     $   snl,
     $   csr,
     $   snr)
c
c       lapack_dlagv2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  alphar(*)
        DOUBLE PRECISION  alphai(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  csl
        DOUBLE PRECISION  snl
        DOUBLE PRECISION  csr
        DOUBLE PRECISION  snr

        CALL fdlagv2(a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   csl,
     $   snl,
     $   csr,
     $   snr)
        RETURN
        END
