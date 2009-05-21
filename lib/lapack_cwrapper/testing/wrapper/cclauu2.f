        SUBROUTINE cclauu2(uplo,
     $   n,
     $   a,
     $   lda,
     $   info)
c
c       lapack_clauu2.c
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
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        INTEGER  info

        CALL fclauu2(uplo,
     $   n,
     $   a,
     $   lda,
     $   info)
        RETURN
        END
