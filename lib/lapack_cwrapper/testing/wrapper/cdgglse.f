        SUBROUTINE cdgglse(m,
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
c       lapack_dgglse.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgglse(m,
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
