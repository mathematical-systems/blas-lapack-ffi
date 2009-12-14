        SUBROUTINE cdlauum(uplo,
     $   n,
     $   a,
     $   lda,
     $   info)
c
c       lapack_dlauum.c
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
        INTEGER  info

        CALL fdlauum(uplo,
     $   n,
     $   a,
     $   lda,
     $   info)
        RETURN
        END
