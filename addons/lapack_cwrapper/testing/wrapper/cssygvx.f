        SUBROUTINE cssygvx(itype,
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
c       lapack_ssygvx.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
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

        CALL fssygvx(itype,
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
