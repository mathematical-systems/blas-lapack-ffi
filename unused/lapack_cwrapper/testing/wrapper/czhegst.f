        SUBROUTINE czhegst(itype,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_zhegst.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  uplo
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzhegst(itype,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
