        SUBROUTINE csggsvd(jobu,
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
c       lapack_sggsvd.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  alpha(*)
        REAL  beta(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  v(*)
        INTEGER  ldv
        REAL  q(*)
        INTEGER  ldq
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsggsvd(jobu,
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
