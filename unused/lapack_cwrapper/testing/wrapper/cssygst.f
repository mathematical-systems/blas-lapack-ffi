        SUBROUTINE cssygst(itype,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_ssygst.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fssygst(itype,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
