        SUBROUTINE cztgsja(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   p,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   tola,
     $   tolb,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   work,
     $   ncycle,
     $   info)
c
c       lapack_ztgsja.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobu
        CHARACTER  jobv
        CHARACTER  jobq
        INTEGER  m
        INTEGER  p
        INTEGER  n
        INTEGER  k
        INTEGER  l
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  tola
        DOUBLE PRECISION  tolb
        DOUBLE PRECISION  alpha(*)
        DOUBLE PRECISION  beta(*)
        COMPLEX*16  u(*)
        INTEGER  ldu
        COMPLEX*16  v(*)
        INTEGER  ldv
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  work(*)
        INTEGER  ncycle
        INTEGER  info

        CALL fztgsja(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   p,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   tola,
     $   tolb,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   work,
     $   ncycle,
     $   info)
        RETURN
        END
