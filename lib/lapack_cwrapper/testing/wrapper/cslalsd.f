        SUBROUTINE cslalsd(uplo,
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
     $   iwork,
     $   info)
c
c       lapack_slalsd.c
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
        REAL  d(*)
        REAL  e(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  rcond
        INTEGER  rank
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslalsd(uplo,
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
     $   iwork,
     $   info)
        RETURN
        END
