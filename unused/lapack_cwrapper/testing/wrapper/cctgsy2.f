        SUBROUTINE cctgsy2(trans,
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
c       lapack_ctgsy2.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  d(*)
        INTEGER  ldd
        COMPLEX  e(*)
        INTEGER  lde
        COMPLEX  f(*)
        INTEGER  ldf
        REAL  scale
        REAL  rdsum
        REAL  rdscal
        INTEGER  info

        CALL fctgsy2(trans,
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
