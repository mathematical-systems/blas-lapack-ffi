        SUBROUTINE czlaqsy(uplo,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   equed)
c
c       lapack_zlaqsy.c
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
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  scond
        DOUBLE PRECISION  amax
        CHARACTER  equed

        CALL fzlaqsy(uplo,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   equed)
        RETURN
        END
