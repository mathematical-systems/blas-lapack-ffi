        SUBROUTINE cdggqrf(n,
     $   m,
     $   p,
     $   a,
     $   lda,
     $   taua,
     $   b,
     $   ldb,
     $   taub,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dggqrf.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  m
        INTEGER  p
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  taua(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  taub(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdggqrf(n,
     $   m,
     $   p,
     $   a,
     $   lda,
     $   taua,
     $   b,
     $   ldb,
     $   taub,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
