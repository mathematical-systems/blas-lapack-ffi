        REAL FUNCTION cslangb(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_slangb.c
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
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        REAL  ab(*)
        INTEGER  ldab
        REAL  work(*)

        EXTERNAL fslangb
        CALL fslangb(cslangb, norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
