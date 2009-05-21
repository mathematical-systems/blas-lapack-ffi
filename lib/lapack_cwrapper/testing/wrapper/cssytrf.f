        SUBROUTINE cssytrf(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ssytrf.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fssytrf(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
