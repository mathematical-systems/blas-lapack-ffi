        SUBROUTINE csgglse(m,
     $   n,
     $   p,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   d,
     $   x,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_sgglse.c
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
        INTEGER  p
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  c(*)
        REAL  d(*)
        REAL  x(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsgglse(m,
     $   n,
     $   p,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   d,
     $   x,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
