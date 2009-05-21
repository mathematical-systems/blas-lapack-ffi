        SUBROUTINE csggglm(n,
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
c       lapack_sggglm.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  d(*)
        REAL  x(*)
        REAL  y(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsggglm(n,
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
