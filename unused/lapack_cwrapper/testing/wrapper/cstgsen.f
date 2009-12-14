        SUBROUTINE cstgsen(ijob,
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
c       lapack_stgsen.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  z(*)
        INTEGER  ldz
        INTEGER  m
        REAL  pl
        REAL  pr
        REAL  dif(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fstgsen(ijob,
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
