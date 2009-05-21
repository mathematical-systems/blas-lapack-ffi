        SUBROUTINE ccgges(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
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
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
c
c       lapack_cgges.c
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
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fcgges(jobvsl,
     $   jobvsr,
     $   sort,
     $   selctg,
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
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
        RETURN
        END
