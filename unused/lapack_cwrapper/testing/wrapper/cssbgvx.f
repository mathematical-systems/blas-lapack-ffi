        SUBROUTINE cssbgvx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   q,
     $   ldq,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   m,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_ssbgvx.c
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
        CHARACTER  range
        CHARACTER  uplo
        INTEGER  n
        INTEGER  ka
        INTEGER  kb
        REAL  ab(*)
        INTEGER  ldab
        REAL  bb(*)
        INTEGER  ldbb
        REAL  q(*)
        INTEGER  ldq
        REAL  vl
        REAL  vu
        INTEGER  il
        INTEGER  iu
        REAL  abstol
        INTEGER  m
        REAL  w(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fssbgvx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   ka,
     $   kb,
     $   ab,
     $   ldab,
     $   bb,
     $   ldbb,
     $   q,
     $   ldq,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   m,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
