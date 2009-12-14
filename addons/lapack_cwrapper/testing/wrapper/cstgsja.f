        SUBROUTINE cstgsja(jobu,
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
c       lapack_stgsja.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  tola
        REAL  tolb
        REAL  alpha(*)
        REAL  beta(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  v(*)
        INTEGER  ldv
        REAL  q(*)
        INTEGER  ldq
        REAL  work(*)
        INTEGER  ncycle
        INTEGER  info

        CALL fstgsja(jobu,
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
