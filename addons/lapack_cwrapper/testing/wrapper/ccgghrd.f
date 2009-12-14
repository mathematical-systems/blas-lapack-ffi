        SUBROUTINE ccgghrd(compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   info)
c
c       lapack_cgghrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  compq
        CHARACTER  compz
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  z(*)
        INTEGER  ldz
        INTEGER  info

        CALL fcgghrd(compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   info)
        RETURN
        END
