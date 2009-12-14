        SUBROUTINE cdlag2(a,
     $   lda,
     $   b,
     $   ldb,
     $   safmin,
     $   scale1,
     $   scale2,
     $   wr1,
     $   wr2,
     $   wi)
c
c       lapack_dlag2.c
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
        DOUBLE PRECISION  safmin
        DOUBLE PRECISION  scale1
        DOUBLE PRECISION  scale2
        DOUBLE PRECISION  wr1
        DOUBLE PRECISION  wr2
        DOUBLE PRECISION  wi

        CALL fdlag2(a,
     $   lda,
     $   b,
     $   ldb,
     $   safmin,
     $   scale1,
     $   scale2,
     $   wr1,
     $   wr2,
     $   wi)
        RETURN
        END
