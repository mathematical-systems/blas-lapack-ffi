        SUBROUTINE cstgex2(wantq,
     $   wantz,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   j1,
     $   n1,
     $   n2,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_stgex2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  wantq
        LOGICAL  wantz
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  q(*)
        INTEGER  ldq
        REAL  z(*)
        INTEGER  ldz
        INTEGER  j1
        INTEGER  n1
        INTEGER  n2
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fstgex2(wantq,
     $   wantz,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   j1,
     $   n1,
     $   n2,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
