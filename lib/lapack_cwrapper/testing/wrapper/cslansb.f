        REAL FUNCTION cslansb(norm,
     $   uplo,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_slansb.c
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
        INTEGER  k
        REAL  ab(*)
        INTEGER  ldab
        REAL  work(*)

        EXTERNAL fslansb
        CALL fslansb(cslansb, norm,
     $   uplo,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
