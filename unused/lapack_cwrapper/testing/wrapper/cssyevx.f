        SUBROUTINE cssyevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   a,
     $   lda,
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
     $   lwork,
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_ssyevx.c
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
        REAL  a(*)
        INTEGER  lda
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
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fssyevx(jobz,
     $   range,
     $   uplo,
     $   n,
     $   a,
     $   lda,
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
     $   lwork,
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
