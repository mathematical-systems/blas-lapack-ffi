        SUBROUTINE cdtgex2(wantq,
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
c       lapack_dtgex2.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        INTEGER  j1
        INTEGER  n1
        INTEGER  n2
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdtgex2(wantq,
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
