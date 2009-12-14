        SUBROUTINE csggesx(jobvsl,
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
c       lapack_sggesx.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        INTEGER  sdim
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  vsl(*)
        INTEGER  ldvsl
        REAL  vsr(*)
        INTEGER  ldvsr
        REAL  rconde(*)
        REAL  rcondv(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fsggesx(jobvsl,
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
