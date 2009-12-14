        SUBROUTINE cztgex2(wantq,
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
     $   info)
c
c       lapack_ztgex2.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  z(*)
        INTEGER  ldz
        INTEGER  j1
        INTEGER  info

        CALL fztgex2(wantq,
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
     $   info)
        RETURN
        END
