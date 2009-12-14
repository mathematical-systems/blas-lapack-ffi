        SUBROUTINE cdggrqf(m,
     $   p,
     $   n,
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
c       lapack_dggrqf.c
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
        INTEGER  p
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  taua(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  taub(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdggrqf(m,
     $   p,
     $   n,
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
