        SUBROUTINE czgges(jobvsl,
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
c       lapack_zgges.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  sdim
        COMPLEX*16  alpha(*)
        COMPLEX*16  beta(*)
        COMPLEX*16  vsl(*)
        INTEGER  ldvsl
        COMPLEX*16  vsr(*)
        INTEGER  ldvsr
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fzgges(jobvsl,
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
