        SUBROUTINE cztgsy2(trans,
     $   ijob,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   ldc,
     $   d,
     $   ldd,
     $   e,
     $   lde,
     $   f,
     $   ldf,
     $   scale,
     $   rdsum,
     $   rdscal,
     $   info)
c
c       lapack_ztgsy2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trans
        INTEGER  ijob
        INTEGER  m
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  d(*)
        INTEGER  ldd
        COMPLEX*16  e(*)
        INTEGER  lde
        COMPLEX*16  f(*)
        INTEGER  ldf
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  rdsum
        DOUBLE PRECISION  rdscal
        INTEGER  info

        CALL fztgsy2(trans,
     $   ijob,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   c,
     $   ldc,
     $   d,
     $   ldd,
     $   e,
     $   lde,
     $   f,
     $   ldf,
     $   scale,
     $   rdsum,
     $   rdscal,
     $   info)
        RETURN
        END
