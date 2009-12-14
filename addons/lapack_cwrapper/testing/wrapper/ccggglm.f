        SUBROUTINE ccggglm(n,
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
c       lapack_cggglm.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  d(*)
        COMPLEX  x(*)
        COMPLEX  y(*)
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcggglm(n,
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
