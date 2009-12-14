        SUBROUTINE cdsbgv(jobz,
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
     $   info)
c
c       lapack_dsbgv.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  bb(*)
        INTEGER  ldbb
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdsbgv(jobz,
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
     $   info)
        RETURN
        END
