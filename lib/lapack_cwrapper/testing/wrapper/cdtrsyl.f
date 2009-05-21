        SUBROUTINE cdtrsyl(trana,
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
c       lapack_dtrsyl.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  scale
        INTEGER  info

        CALL fdtrsyl(trana,
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
