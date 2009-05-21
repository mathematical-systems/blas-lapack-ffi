        SUBROUTINE czggevx(balanc,
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
c       lapack_zggevx.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  alpha(*)
        COMPLEX*16  beta(*)
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  lscale(*)
        DOUBLE PRECISION  rscale(*)
        DOUBLE PRECISION  abnrm
        DOUBLE PRECISION  bbnrm
        DOUBLE PRECISION  rconde(*)
        DOUBLE PRECISION  rcondv(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  iwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fzggevx(balanc,
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
