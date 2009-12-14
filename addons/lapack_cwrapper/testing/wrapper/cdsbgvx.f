        SUBROUTINE cdsbgvx(jobz,
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
c       lapack_dsbgvx.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  bb(*)
        INTEGER  ldbb
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  vl
        DOUBLE PRECISION  vu
        INTEGER  il
        INTEGER  iu
        DOUBLE PRECISION  abstol
        INTEGER  m
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fdsbgvx(jobz,
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
