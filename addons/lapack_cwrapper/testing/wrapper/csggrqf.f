        SUBROUTINE csggrqf(m,
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
c       lapack_sggrqf.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  taua(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  taub(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsggrqf(m,
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
