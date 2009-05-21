        SUBROUTINE czggglm(n,
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
c       lapack_zggglm.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  d(*)
        COMPLEX*16  x(*)
        COMPLEX*16  y(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzggglm(n,
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
