        SUBROUTINE cztrsyl(trana,
     $   tranb,
     $   isgn,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   ldc,
     $   scale,
     $   info)
c
c       lapack_ztrsyl.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trana
        CHARACTER  tranb
        INTEGER  isgn
        INTEGER  m
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  scale
        INTEGER  info

        CALL fztrsyl(trana,
     $   tranb,
     $   isgn,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   ldc,
     $   scale,
     $   info)
        RETURN
        END
