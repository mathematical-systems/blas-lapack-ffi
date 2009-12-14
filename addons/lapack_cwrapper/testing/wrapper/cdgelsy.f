        SUBROUTINE cdgelsy(m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   jpvt,
     $   rcond,
     $   rank,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgelsy.c
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
        INTEGER  jpvt(*)
        DOUBLE PRECISION  rcond
        INTEGER  rank
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgelsy(m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   jpvt,
     $   rcond,
     $   rank,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
