        SUBROUTINE cchpevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   ap,
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
c       lapack_chpevx.c
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
        COMPLEX  ap(*)
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

        CALL fchpevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   ap,
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
