        SUBROUTINE czhbgst(vect,
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
c       lapack_zhbgst.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        COMPLEX*16  bb(*)
        INTEGER  ldbb
        COMPLEX*16  x(*)
        INTEGER  ldx
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzhbgst(vect,
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
