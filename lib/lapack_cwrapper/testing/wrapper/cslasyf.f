        SUBROUTINE cslasyf(uplo,
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
c       lapack_slasyf.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        REAL  w(*)
        INTEGER  ldw
        INTEGER  info

        CALL fslasyf(uplo,
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
