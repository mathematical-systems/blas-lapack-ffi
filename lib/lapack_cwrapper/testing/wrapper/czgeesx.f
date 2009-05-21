        SUBROUTINE czgeesx(jobvs,
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
c       lapack_zgeesx.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  sdim
        COMPLEX*16  w(*)
        COMPLEX*16  vs(*)
        INTEGER  ldvs
        DOUBLE PRECISION  rconde
        DOUBLE PRECISION  rcondv
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fzgeesx(jobvs,
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
