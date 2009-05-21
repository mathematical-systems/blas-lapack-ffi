        SUBROUTINE cslaqsy(uplo,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   equed)
c
c       lapack_slaqsy.c
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
        REAL  s(*)
        REAL  scond
        REAL  amax
        CHARACTER  equed

        CALL fslaqsy(uplo,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   equed)
        RETURN
        END
