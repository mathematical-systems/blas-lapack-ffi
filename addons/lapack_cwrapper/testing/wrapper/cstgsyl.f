        SUBROUTINE cstgsyl(trans,
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
     $   dif,
     $   scale,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
c
c       lapack_stgsyl.c
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
        REAL  dif
        REAL  scale
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fstgsyl(trans,
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
     $   dif,
     $   scale,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
        RETURN
        END
