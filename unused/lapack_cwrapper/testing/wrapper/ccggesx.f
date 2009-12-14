        SUBROUTINE ccggesx(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   sdim,
     $   alpha,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
c
c       lapack_cggesx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobvsl
        CHARACTER  jobvsr
        CHARACTER  sort
        LOGICAL selctg
        EXTERNAL selctg

        CHARACTER  sense
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        INTEGER  sdim
        COMPLEX  alpha(*)
        COMPLEX  beta(*)
        COMPLEX  vsl(*)
        INTEGER  ldvsl
        COMPLEX  vsr(*)
        INTEGER  ldvsr
        REAL  rconde(*)
        REAL  rcondv(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  iwork(*)
        INTEGER  liwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fcggesx(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   sdim,
     $   alpha,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
        RETURN
        END
