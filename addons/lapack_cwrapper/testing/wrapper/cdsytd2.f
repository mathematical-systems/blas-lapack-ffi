        SUBROUTINE cdsytd2(uplo,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tau,
     $   info)
c
c       lapack_dsytd2.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  tau(*)
        INTEGER  info

        CALL fdsytd2(uplo,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tau,
     $   info)
        RETURN
        END
