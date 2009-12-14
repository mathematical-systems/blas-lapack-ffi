        SUBROUTINE cstgsy2(trans,
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
     $   iwork,
     $   pq,
     $   info)
c
c       lapack_stgsy2.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  c(*)
        INTEGER  ldc
        REAL  d(*)
        INTEGER  ldd
        REAL  e(*)
        INTEGER  lde
        REAL  f(*)
        INTEGER  ldf
        REAL  scale
        REAL  rdsum
        REAL  rdscal
        INTEGER  iwork(*)
        INTEGER  pq
        INTEGER  info

        CALL fstgsy2(trans,
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
     $   iwork,
     $   pq,
     $   info)
        RETURN
        END
