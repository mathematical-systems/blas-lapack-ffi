        REAL FUNCTION cclantp(norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   work)
c
c       lapack_clantp.c
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
        COMPLEX  ap(*)
        REAL  work(*)

        EXTERNAL fclantp
        CALL fclantp(cclantp, norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
