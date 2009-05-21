        SUBROUTINE csgegs(jobvsl,
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
c       lapack_sgegs.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  vsl(*)
        INTEGER  ldvsl
        REAL  vsr(*)
        INTEGER  ldvsr
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsgegs(jobvsl,
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
