        SUBROUTINE csgelsd(m,
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
c       lapack_sgelsd.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  s(*)
        REAL  rcond
        INTEGER  rank
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgelsd(m,
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
