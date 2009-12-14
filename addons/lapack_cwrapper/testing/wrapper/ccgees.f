        SUBROUTINE ccgees(jobvs,
     $   sort,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   w,
     $   vs,
     $   ldvs,
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
c
c       lapack_cgees.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobvs
        CHARACTER  sort
        LOGICAL select
        EXTERNAL select

        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        INTEGER  sdim
        COMPLEX  w(*)
        COMPLEX  vs(*)
        INTEGER  ldvs
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fcgees(jobvs,
     $   sort,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   w,
     $   vs,
     $   ldvs,
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
        RETURN
        END
