        SUBROUTINE ccgelss(m,
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
     $   info)
c
c       lapack_cgelss.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        REAL  s(*)
        REAL  rcond
        INTEGER  rank
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcgelss(m,
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
     $   info)
        RETURN
        END
