        SUBROUTINE cdsbgst(vect,
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
c       lapack_dsbgst.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  bb(*)
        INTEGER  ldbb
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdsbgst(vect,
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
