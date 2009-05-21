        REAL FUNCTION cslansp(norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
c
c       lapack_slansp.c
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
        REAL  ap(*)
        REAL  work(*)

        EXTERNAL fslansp
        CALL fslansp(cslansp, norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
