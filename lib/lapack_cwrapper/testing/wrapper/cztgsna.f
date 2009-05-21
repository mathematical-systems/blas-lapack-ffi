        SUBROUTINE cztgsna(job,
     $   howmny,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   s,
     $   dif,
     $   mm,
     $   m,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
c
c       lapack_ztgsna.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  job
        CHARACTER  howmny
        LOGICAL  select(*)
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  dif(*)
        INTEGER  mm
        INTEGER  m
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fztgsna(job,
     $   howmny,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   s,
     $   dif,
     $   mm,
     $   m,
     $   work,
     $   lwork,
     $   iwork,
     $   info)
        RETURN
        END
