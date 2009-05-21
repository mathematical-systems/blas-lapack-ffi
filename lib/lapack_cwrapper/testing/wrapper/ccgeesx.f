        SUBROUTINE ccgeesx(jobvs,
     $   sort,
     $   select,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   w,
     $   vs,
     $   ldvs,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
c
c       lapack_cgeesx.c
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

        CHARACTER  sense
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        INTEGER  sdim
        COMPLEX  w(*)
        COMPLEX  vs(*)
        INTEGER  ldvs
        REAL  rconde
        REAL  rcondv
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fcgeesx(jobvs,
     $   sort,
     $   select,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   w,
     $   vs,
     $   ldvs,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   bwork,
     $   info)
        RETURN
        END
