        SUBROUTINE czggsvd(jobu,
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
c       lapack_zggsvd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  alpha(*)
        DOUBLE PRECISION  beta(*)
        COMPLEX*16  u(*)
        INTEGER  ldu
        COMPLEX*16  v(*)
        INTEGER  ldv
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fzggsvd(jobu,
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
