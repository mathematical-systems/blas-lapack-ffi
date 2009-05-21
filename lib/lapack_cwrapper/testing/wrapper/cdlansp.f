        DOUBLE PRECISION FUNCTION cdlansp(norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
c
c       lapack_dlansp.c
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
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  work(*)

        EXTERNAL fdlansp
        CALL fdlansp(cdlansp, norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
