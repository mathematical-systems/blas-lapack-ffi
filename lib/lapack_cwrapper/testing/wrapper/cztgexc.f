        SUBROUTINE cztgexc(wantq,
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
     $   ifst,
     $   ilst,
     $   info)
c
c       lapack_ztgexc.c
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
        INTEGER  ifst
        INTEGER  ilst
        INTEGER  info

        CALL fztgexc(wantq,
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
     $   ifst,
     $   ilst,
     $   info)
        RETURN
        END
