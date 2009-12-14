        SUBROUTINE ccgegv(jobvl,
     $   jobvr,
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
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_cgegv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobvl
        CHARACTER  jobvr
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
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcgegv(jobvl,
     $   jobvr,
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
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
