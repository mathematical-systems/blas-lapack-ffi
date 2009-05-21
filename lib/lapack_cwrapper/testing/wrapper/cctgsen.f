        SUBROUTINE cctgsen(ijob,
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
c       lapack_ctgsen.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  alpha(*)
        COMPLEX  beta(*)
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  z(*)
        INTEGER  ldz
        INTEGER  m
        REAL  pl
        REAL  pr
        REAL  dif(*)
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fctgsen(ijob,
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
