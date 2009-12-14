        SUBROUTINE cclasyf(uplo,
     $   n,
     $   nb,
     $   kb,
     $   a,
     $   lda,
     $   ipiv,
     $   w,
     $   ldw,
     $   info)
c
c       lapack_clasyf.c
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
        INTEGER  nb
        INTEGER  kb
        COMPLEX  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        COMPLEX  w(*)
        INTEGER  ldw
        INTEGER  info

        CALL fclasyf(uplo,
     $   n,
     $   nb,
     $   kb,
     $   a,
     $   lda,
     $   ipiv,
     $   w,
     $   ldw,
     $   info)
        RETURN
        END
