        SUBROUTINE czlatrd(uplo,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   e,
     $   tau,
     $   w,
     $   ldw)
c
c       lapack_zlatrd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  e(*)
        COMPLEX*16  tau(*)
        COMPLEX*16  w(*)
        INTEGER  ldw

        CALL fzlatrd(uplo,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   e,
     $   tau,
     $   w,
     $   ldw)
        RETURN
        END
