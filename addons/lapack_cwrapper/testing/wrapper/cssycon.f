        SUBROUTINE cssycon(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_ssycon.c
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
        REAL  anorm
        REAL  rcond
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fssycon(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
