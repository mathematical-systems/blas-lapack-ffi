        SUBROUTINE ccggsvd(jobu,
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
     $   rwork,
     $   iwork,
     $   info)
c
c       lapack_cggsvd.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        REAL  alpha(*)
        REAL  beta(*)
        COMPLEX  u(*)
        INTEGER  ldu
        COMPLEX  v(*)
        INTEGER  ldv
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fcggsvd(jobu,
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
     $   rwork,
     $   iwork,
     $   info)
        RETURN
        END
