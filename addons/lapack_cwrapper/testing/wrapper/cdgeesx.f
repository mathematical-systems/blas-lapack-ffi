        SUBROUTINE cdgeesx(jobvs,
     $   sort,
     $   select,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   wr,
     $   wi,
     $   vs,
     $   ldvs,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
c
c       lapack_dgeesx.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  sdim
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        DOUBLE PRECISION  vs(*)
        INTEGER  ldvs
        DOUBLE PRECISION  rconde
        DOUBLE PRECISION  rcondv
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fdgeesx(jobvs,
     $   sort,
     $   select,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   sdim,
     $   wr,
     $   wi,
     $   vs,
     $   ldvs,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   bwork,
     $   info)
        RETURN
        END
