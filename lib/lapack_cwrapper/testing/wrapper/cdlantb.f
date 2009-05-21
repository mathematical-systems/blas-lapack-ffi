        DOUBLE PRECISION FUNCTION cdlantb(norm,
     $   uplo,
     $   diag,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_dlantb.c
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
        INTEGER  k
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  work(*)

        EXTERNAL fdlantb
        CALL fdlantb(cdlantb, norm,
     $   uplo,
     $   diag,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
