        SUBROUTINE cdsygvx(itype,
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
     $   iwork,
     $   ifail,
     $   info)
c
c       lapack_dsygvx.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
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
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  ifail(*)
        INTEGER  info

        CALL fdsygvx(itype,
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
     $   iwork,
     $   ifail,
     $   info)
        RETURN
        END
