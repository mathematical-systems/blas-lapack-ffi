        SUBROUTINE cdgees(jobvs,
     $   sort,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   wr,
     $   wi,
     $   vs,
     $   ldvs,
     $   work,
     $   lwork,
     $   bwork,
     $   info)
c
c       lapack_dgees.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  sdim
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        DOUBLE PRECISION  vs(*)
        INTEGER  ldvs
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fdgees(jobvs,
     $   sort,
     $   select,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   wr,
     $   wi,
     $   vs,
     $   ldvs,
     $   work,
     $   lwork,
     $   bwork,
     $   info)
        RETURN
        END
