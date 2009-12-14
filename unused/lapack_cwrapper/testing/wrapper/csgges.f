        SUBROUTINE csgges(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
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
     $   work,
     $   lwork,
     $   bwork,
     $   info)
c
c       lapack_sgges.c
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
        REAL  work(*)
        INTEGER  lwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fsgges(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
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
     $   work,
     $   lwork,
     $   bwork,
     $   info)
        RETURN
        END
