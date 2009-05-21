        REAL FUNCTION cslantp(norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   work)
c
c       lapack_slantp.c
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
        REAL  ap(*)
        REAL  work(*)

        EXTERNAL fslantp
        CALL fslantp(cslantp, norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
