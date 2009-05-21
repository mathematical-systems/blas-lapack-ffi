        SUBROUTINE ccggevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
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
     $   rwork,
     $   iwork,
     $   bwork,
     $   info)
c
c       lapack_cggevx.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  alpha(*)
        COMPLEX  beta(*)
        COMPLEX  vl(*)
        INTEGER  ldvl
        COMPLEX  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        REAL  lscale(*)
        REAL  rscale(*)
        REAL  abnrm
        REAL  bbnrm
        REAL  rconde(*)
        REAL  rcondv(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  iwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fcggevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alpha,
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
     $   rwork,
     $   iwork,
     $   bwork,
     $   info)
        RETURN
        END
