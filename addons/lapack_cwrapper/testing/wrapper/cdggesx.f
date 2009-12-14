        SUBROUTINE cdggesx(jobvsl,
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
     $   alphar,
     $   alphai,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
c
c       lapack_dggesx.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        INTEGER  sdim
        DOUBLE PRECISION  alphar(*)
        DOUBLE PRECISION  alphai(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  vsl(*)
        INTEGER  ldvsl
        DOUBLE PRECISION  vsr(*)
        INTEGER  ldvsr
        DOUBLE PRECISION  rconde(*)
        DOUBLE PRECISION  rcondv(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fdggesx(jobvsl,
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
     $   alphar,
     $   alphai,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
        RETURN
        END
