        SUBROUTINE csgees(jobvs,
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
c       lapack_sgees.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  sdim
        REAL  wr(*)
        REAL  wi(*)
        REAL  vs(*)
        INTEGER  ldvs
        REAL  work(*)
        INTEGER  lwork
        LOGICAL  bwork(*)
        INTEGER  info

        CALL fsgees(jobvs,
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
