        DOUBLE PRECISION FUNCTION cdlangb(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_dlangb.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  work(*)

        EXTERNAL fdlangb
        CALL fdlangb(cdlangb, norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
