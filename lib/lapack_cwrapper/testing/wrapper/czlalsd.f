        SUBROUTINE czlalsd(uplo,
     $   smlsiz,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   rcond,
     $   rank,
     $   work,
     $   rwork,
     $   iwork,
     $   info)
c
c       lapack_zlalsd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  smlsiz
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  rcond
        INTEGER  rank
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fzlalsd(uplo,
     $   smlsiz,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   rcond,
     $   rank,
     $   work,
     $   rwork,
     $   iwork,
     $   info)
        RETURN
        END
