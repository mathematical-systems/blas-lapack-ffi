        SUBROUTINE csggqrf(n,
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
c       lapack_sggqrf.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  taua(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  taub(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsggqrf(n,
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
