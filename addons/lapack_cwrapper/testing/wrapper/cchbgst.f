        SUBROUTINE cchbgst(vect,
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
     $   rwork,
     $   info)
c
c       lapack_chbgst.c
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
        COMPLEX  ab(*)
        INTEGER  ldab
        COMPLEX  bb(*)
        INTEGER  ldbb
        COMPLEX  x(*)
        INTEGER  ldx
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fchbgst(vect,
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
     $   rwork,
     $   info)
        RETURN
        END
