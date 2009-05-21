        SUBROUTINE ccpocon(uplo,
     $   n,
     $   a,
     $   lda,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_cpocon.c
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
        COMPLEX  a(*)
        INTEGER  lda
        REAL  anorm
        REAL  rcond
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcpocon(uplo,
     $   n,
     $   a,
     $   lda,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
