        SUBROUTINE cdtgsna(job,
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
c       lapack_dtgsna.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  dif(*)
        INTEGER  mm
        INTEGER  m
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdtgsna(job,
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
