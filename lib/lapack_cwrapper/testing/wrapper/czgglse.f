        SUBROUTINE czgglse(m,
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
c       lapack_zgglse.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  c(*)
        COMPLEX*16  d(*)
        COMPLEX*16  x(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzgglse(m,
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
