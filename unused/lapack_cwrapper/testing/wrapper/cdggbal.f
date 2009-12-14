        SUBROUTINE cdggbal(job,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   work,
     $   info)
c
c       lapack_dggbal.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  job
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  lscale(*)
        DOUBLE PRECISION  rscale(*)
        REAL  work(*)
        INTEGER  info

        CALL fdggbal(job,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   work,
     $   info)
        RETURN
        END
