        SUBROUTINE cssysv(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ssysv.c
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
        INTEGER  nrhs
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fssysv(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
