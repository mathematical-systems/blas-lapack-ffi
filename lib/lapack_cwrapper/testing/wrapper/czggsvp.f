        SUBROUTINE czggsvp(jobu,
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
c       lapack_zggsvp.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  tola
        DOUBLE PRECISION  tolb
        INTEGER  k
        INTEGER  l
        COMPLEX*16  u(*)
        INTEGER  ldu
        COMPLEX*16  v(*)
        INTEGER  ldv
        COMPLEX*16  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        DOUBLE PRECISION  rwork(*)
        COMPLEX*16  tau(*)
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzggsvp(jobu,
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
