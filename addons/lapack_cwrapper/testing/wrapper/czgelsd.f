        SUBROUTINE czgelsd(m,
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
     $   rwork,
     $   iwork,
     $   info)
c
c       lapack_zgelsd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  rcond
        INTEGER  rank
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fzgelsd(m,
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
     $   rwork,
     $   iwork,
     $   info)
        RETURN
        END
