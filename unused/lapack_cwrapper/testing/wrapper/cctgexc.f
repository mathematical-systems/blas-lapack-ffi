        SUBROUTINE cctgexc(wantq,
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
c       lapack_ctgexc.c
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
        INTEGER  ifst
        INTEGER  ilst
        INTEGER  info

        CALL fctgexc(wantq,
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
