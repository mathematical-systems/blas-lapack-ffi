        SUBROUTINE czhbevx(jobz,
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
c       lapack_zhbevx.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        COMPLEX*16  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  vl
        DOUBLE PRECISION  vu
        INTEGER  il
        INTEGER  iu
        DOUBLE PRECISION  abstol
        INTEGER  m
        DOUBLE PRECISION  w(*)
        COMPLEX*16  z(*)
        INTEGER  ldz
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fzhbevx(jobz,
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
