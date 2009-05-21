        SUBROUTINE cztgsen(ijob,
     $   wantq,
     $   wantz,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
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
c       lapack_ztgsen.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  alpha(*)
        COMPLEX*16  beta(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  z(*)
        INTEGER  ldz
        INTEGER  m
        DOUBLE PRECISION  pl
        DOUBLE PRECISION  pr
        DOUBLE PRECISION  dif(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fztgsen(ijob,
     $   wantq,
     $   wantz,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
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
