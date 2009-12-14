        SUBROUTINE cctgex2(wantq,
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
c       lapack_ctgex2.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  z(*)
        INTEGER  ldz
        INTEGER  j1
        INTEGER  info

        CALL fctgex2(wantq,
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
