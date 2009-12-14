        DOUBLE PRECISION FUNCTION czlantb(norm,
     $   uplo,
     $   diag,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_zlantb.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  work(*)

        EXTERNAL fzlantb
        CALL fzlantb(czlantb, norm,
     $   uplo,
     $   diag,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
