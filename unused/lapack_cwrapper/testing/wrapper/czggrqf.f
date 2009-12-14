        SUBROUTINE czggrqf(m,
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
c       lapack_zggrqf.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  taua(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  taub(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzggrqf(m,
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
