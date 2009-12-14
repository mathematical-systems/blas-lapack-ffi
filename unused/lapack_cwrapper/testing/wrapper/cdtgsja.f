        SUBROUTINE cdtgsja(jobu,
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
c       lapack_dtgsja.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  tola
        DOUBLE PRECISION  tolb
        DOUBLE PRECISION  alpha(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  v(*)
        INTEGER  ldv
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  work(*)
        INTEGER  ncycle
        INTEGER  info

        CALL fdtgsja(jobu,
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
