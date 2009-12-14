        SUBROUTINE cdgegs(jobvsl,
     $   jobvsr,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgegs.c
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
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  alphar(*)
        DOUBLE PRECISION  alphai(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  vsl(*)
        INTEGER  ldvsl
        DOUBLE PRECISION  vsr(*)
        INTEGER  ldvsr
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgegs(jobvsl,
     $   jobvsr,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   alphar,
     $   alphai,
     $   beta,
     $   vsl,
     $   ldvsl,
     $   vsr,
     $   ldvsr,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
