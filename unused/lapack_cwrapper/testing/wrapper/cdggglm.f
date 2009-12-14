        SUBROUTINE cdggglm(n,
     $   m,
     $   p,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   d,
     $   x,
     $   y,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dggglm.c
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
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  y(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdggglm(n,
     $   m,
     $   p,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   d,
     $   x,
     $   y,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
