        SUBROUTINE cslag2(a,
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
c       lapack_slag2.c
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
        REAL  safmin
        REAL  scale1
        REAL  scale2
        REAL  wr1
        REAL  wr2
        REAL  wi

        CALL fslag2(a,
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
