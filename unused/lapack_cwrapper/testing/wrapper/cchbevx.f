        SUBROUTINE cchbevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
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
     $   rwork,
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_chbevx.c
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
        INTEGER  kd
        COMPLEX  ab(*)
        INTEGER  ldab
        COMPLEX  q(*)
        INTEGER  ldq
        REAL  vl
        REAL  vu
        INTEGER  il
        INTEGER  iu
        REAL  abstol
        INTEGER  m
        REAL  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fchbevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
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
     $   rwork,
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
