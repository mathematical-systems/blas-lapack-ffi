        SUBROUTINE cdlatrd(uplo,
     $   n,
     $   nb,
     $   a,
     $   lda,
     $   e,
     $   tau,
     $   w,
     $   ldw)
c
c       lapack_dlatrd.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  w(*)
        INTEGER  ldw

        CALL fdlatrd(uplo,
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
