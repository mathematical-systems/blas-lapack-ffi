        SUBROUTINE cslatrd(uplo,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   e,
     $   tau,
     $   w,
     $   ldw)
c
c       lapack_slatrd.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  e(*)
        REAL  tau(*)
        REAL  w(*)
        INTEGER  ldw

        CALL fslatrd(uplo,
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
