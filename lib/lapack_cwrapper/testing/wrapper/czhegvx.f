        SUBROUTINE czhegvx(itype,
     $   jobz,
     $   range,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
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
     $   rwork,
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_zhegvx.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
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
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fzhegvx(itype,
     $   jobz,
     $   range,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
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
     $   rwork,
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
