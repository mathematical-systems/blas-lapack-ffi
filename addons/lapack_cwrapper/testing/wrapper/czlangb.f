        DOUBLE PRECISION FUNCTION czlangb(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_zlangb.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  work(*)

        EXTERNAL fzlangb
        CALL fzlangb(czlangb, norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
