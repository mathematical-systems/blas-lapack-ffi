        SUBROUTINE cdspgvx(itype,
     $   jobz,
     $   range,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
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
c       lapack_dspgvx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  jobz
        CHARACTER  range
        CHARACTER  uplo
        INTEGER  n
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  bp(*)
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

        CALL fdspgvx(itype,
     $   jobz,
     $   range,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
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
