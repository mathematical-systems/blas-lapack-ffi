        SUBROUTINE czhecon(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
c
c       lapack_zhecon.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzhecon(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
        RETURN
        END
