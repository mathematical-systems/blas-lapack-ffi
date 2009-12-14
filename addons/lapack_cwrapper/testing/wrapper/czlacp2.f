        SUBROUTINE czlacp2(uplo,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb)
c
c       lapack_zlacp2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb

        CALL fzlacp2(uplo,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb)
        RETURN
        END
