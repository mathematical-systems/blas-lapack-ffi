        SUBROUTINE cdgelsd(m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   s,
     $   rcond,
     $   rank,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
c
c       lapack_dgelsd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  rcond
        INTEGER  rank
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgelsd(m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   s,
     $   rcond,
     $   rank,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
        RETURN
        END
