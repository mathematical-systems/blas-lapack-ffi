        SUBROUTINE cssbgst(vect,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   x,
     $   ldx,
     $   work,
     $   info)
c
c       lapack_ssbgst.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  vect
        CHARACTER  uplo
        INTEGER  n
        INTEGER  ka
        INTEGER  kb
        REAL  ab(*)
        INTEGER  ldab
        REAL  bb(*)
        INTEGER  ldbb
        REAL  x(*)
        INTEGER  ldx
        REAL  work(*)
        INTEGER  info

        CALL fssbgst(vect,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   x,
     $   ldx,
     $   work,
     $   info)
        RETURN
        END
