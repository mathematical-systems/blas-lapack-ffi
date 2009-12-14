        SUBROUTINE czhegvd(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_zhegvd.c
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
        CHARACTER  uplo
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  w(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  lrwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fzhegvd(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
