        SUBROUTINE csggsvp(jobu,
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
c       lapack_sggsvp.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  tola
        REAL  tolb
        INTEGER  k
        INTEGER  l
        REAL  u(*)
        INTEGER  ldu
        REAL  v(*)
        INTEGER  ldv
        REAL  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        REAL  tau(*)
        REAL  work(*)
        INTEGER  info

        CALL fsggsvp(jobu,
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
