        SUBROUTINE cdtrcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dtrcon.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdtrcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   a,
     $   lda,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
