        SUBROUTINE cdtgsyl(trans,
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
c       lapack_dtgsyl.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  d(*)
        INTEGER  ldd
        DOUBLE PRECISION  e(*)
        INTEGER  lde
        DOUBLE PRECISION  f(*)
        INTEGER  ldf
        DOUBLE PRECISION  dif
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdtgsyl(trans,
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
