        SUBROUTINE cstgexc(wantq,
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
     $   work,
     $   lwork,
     $   info)
c
c       lapack_stgexc.c
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
        INTEGER  ifst
        INTEGER  ilst
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fstgexc(wantq,
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
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
