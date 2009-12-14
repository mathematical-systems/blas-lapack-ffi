        SUBROUTINE cdgelsx(m,
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
     $   info)
c
c       lapack_dgelsx.c
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
        INTEGER  info

        CALL fdgelsx(m,
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
     $   info)
        RETURN
        END
