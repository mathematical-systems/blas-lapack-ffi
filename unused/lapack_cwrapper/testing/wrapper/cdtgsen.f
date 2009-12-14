        SUBROUTINE cdtgsen(ijob,
     $   wantq,
     $   wantz,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   m,
     $   pl,
     $   pr,
     $   dif,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_dtgsen.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  ijob
        LOGICAL  wantq
        LOGICAL  wantz
        LOGICAL  select(*)
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  alphar(*)
        DOUBLE PRECISION  alphai(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        INTEGER  m
        DOUBLE PRECISION  pl
        DOUBLE PRECISION  pr
        DOUBLE PRECISION  dif(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fdtgsen(ijob,
     $   wantq,
     $   wantz,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   m,
     $   pl,
     $   pr,
     $   dif,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
