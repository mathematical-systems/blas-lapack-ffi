        SUBROUTINE csgelsy(m,
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
c       lapack_sgelsy.c
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
        INTEGER  jpvt(*)
        REAL  rcond
        INTEGER  rank
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsgelsy(m,
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
