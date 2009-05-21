        SUBROUTINE cstgsna(job,
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
c       lapack_stgsna.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        REAL  s(*)
        REAL  dif(*)
        INTEGER  mm
        INTEGER  m
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fstgsna(job,
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
