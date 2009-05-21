        SUBROUTINE ccggsvp(jobu,
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
     $   rwork,
     $   tau,
     $   work,
     $   info)
c
c       lapack_cggsvp.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        REAL  tola
        REAL  tolb
        INTEGER  k
        INTEGER  l
        COMPLEX  u(*)
        INTEGER  ldu
        COMPLEX  v(*)
        INTEGER  ldv
        COMPLEX  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        REAL  rwork(*)
        COMPLEX  tau(*)
        COMPLEX  work(*)
        INTEGER  info

        CALL fcggsvp(jobu,
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
     $   rwork,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
