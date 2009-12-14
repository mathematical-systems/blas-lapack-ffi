        SUBROUTINE cdggsvd(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   n,
     $   p,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dggsvd.c
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
        INTEGER  n
        INTEGER  p
        INTEGER  k
        INTEGER  l
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  alpha(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  v(*)
        INTEGER  ldv
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdggsvd(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   n,
     $   p,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
     $   beta,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
