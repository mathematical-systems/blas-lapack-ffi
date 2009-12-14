        SUBROUTINE cdggsvp(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   p,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   tola,
     $   tolb,
     $   k,
     $   l,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   iwork,
     $   tau,
     $   work,
     $   info)
c
c       lapack_dggsvp.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  tola
        DOUBLE PRECISION  tolb
        INTEGER  k
        INTEGER  l
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  v(*)
        INTEGER  ldv
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdggsvp(jobu,
     $   jobv,
     $   jobq,
     $   m,
     $   p,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   tola,
     $   tolb,
     $   k,
     $   l,
     $   u,
     $   ldu,
     $   v,
     $   ldv,
     $   q,
     $   ldq,
     $   iwork,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
