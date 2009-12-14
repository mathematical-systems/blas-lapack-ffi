        SUBROUTINE cdgesdd(jobz,
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
     $   iwork,
     $   info)
c
c       lapack_dgesdd.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgesdd(jobz,
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
     $   iwork,
     $   info)
        RETURN
        END
