        SUBROUTINE cslagv2(a,
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
c       lapack_slagv2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  csl
        REAL  snl
        REAL  csr
        REAL  snr

        CALL fslagv2(a,
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
