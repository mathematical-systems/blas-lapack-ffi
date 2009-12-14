        SUBROUTINE cchbgv(jobz,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_chbgv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        INTEGER  ka
        INTEGER  kb
        COMPLEX  ab(*)
        INTEGER  ldab
        COMPLEX  bb(*)
        INTEGER  ldbb
        REAL  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fchbgv(jobz,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
