        SUBROUTINE czgghrd(compq,
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
c       lapack_zgghrd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  z(*)
        INTEGER  ldz
        INTEGER  info

        CALL fzgghrd(compq,
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
