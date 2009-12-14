        SUBROUTINE czgees(jobvs,
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
c       lapack_zgees.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  sdim
        COMPLEX*16  w(*)
        COMPLEX*16  vs(*)
        INTEGER  ldvs
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fzgees(jobvs,
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
