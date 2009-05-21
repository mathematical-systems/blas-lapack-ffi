        SUBROUTINE cztrcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ztrcon.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        CHARACTER  uplo
        CHARACTER  diag
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fztrcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
