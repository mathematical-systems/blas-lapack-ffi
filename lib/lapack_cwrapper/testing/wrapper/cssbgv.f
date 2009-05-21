        SUBROUTINE cssbgv(jobz,
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
c       lapack_ssbgv.c
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
        REAL  ab(*)
        INTEGER  ldab
        REAL  bb(*)
        INTEGER  ldbb
        REAL  w(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  info

        CALL fssbgv(jobz,
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
