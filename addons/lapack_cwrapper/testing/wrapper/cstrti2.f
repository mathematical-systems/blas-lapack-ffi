        SUBROUTINE cstrti2(uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   info)
c
c       lapack_strti2.c
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
        CHARACTER  diag
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        INTEGER  info

        CALL fstrti2(uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   info)
        RETURN
        END
