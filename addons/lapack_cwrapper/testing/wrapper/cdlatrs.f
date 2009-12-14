        SUBROUTINE cdlatrs(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   a,
     $   lda,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
c
c       lapack_dlatrs.c
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
        CHARACTER  trans
        CHARACTER  diag
        CHARACTER  normin
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  cnorm(*)
        INTEGER  info

        CALL fdlatrs(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   a,
     $   lda,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
        RETURN
        END
