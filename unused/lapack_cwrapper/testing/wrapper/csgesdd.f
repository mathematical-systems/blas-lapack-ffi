        SUBROUTINE csgesdd(jobz,
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
c       lapack_sgesdd.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  s(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  vt(*)
        INTEGER  ldvt
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgesdd(jobz,
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
