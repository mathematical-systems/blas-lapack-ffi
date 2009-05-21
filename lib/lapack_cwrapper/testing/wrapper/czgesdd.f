        SUBROUTINE czgesdd(jobz,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   work,
     $   lwork,
     $   rwork,
     $   iwork,
     $   info)
c
c       lapack_zgesdd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        INTEGER  m
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  s(*)
        COMPLEX*16  u(*)
        INTEGER  ldu
        COMPLEX*16  vt(*)
        INTEGER  ldvt
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fzgesdd(jobz,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   work,
     $   lwork,
     $   rwork,
     $   iwork,
     $   info)
        RETURN
        END
