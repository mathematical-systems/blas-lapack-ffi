        SUBROUTINE czgelsy(m,
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
     $   rwork,
     $   info)
c
c       lapack_zgelsy.c
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
        INTEGER  jpvt(*)
        DOUBLE PRECISION  rcond
        INTEGER  rank
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzgelsy(m,
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
     $   rwork,
     $   info)
        RETURN
        END
