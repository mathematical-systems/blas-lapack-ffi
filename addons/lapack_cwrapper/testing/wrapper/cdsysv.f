        SUBROUTINE cdsysv(uplo,
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
c       lapack_dsysv.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdsysv(uplo,
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
