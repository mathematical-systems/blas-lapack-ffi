        SUBROUTINE csggevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   abnrm,
     $   bbnrm,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   bwork,
     $   info)
c
c       lapack_sggevx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  balanc
        CHARACTER  jobvl
        CHARACTER  jobvr
        CHARACTER  sense
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        REAL  lscale(*)
        REAL  rscale(*)
        REAL  abnrm
        REAL  bbnrm
        REAL  rconde(*)
        REAL  rcondv(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fsggevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   abnrm,
     $   bbnrm,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   bwork,
     $   info)
        RETURN
        END
