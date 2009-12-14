        REAL FUNCTION cclansy(norm,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   work)
c
c       lapack_clansy.c
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
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        REAL  work(*)

        EXTERNAL fclansy
        CALL fclansy(cclansy, norm,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   work)
        RETURN
        END
