        SUBROUTINE csggbal(job,
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
c       lapack_sggbal.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        INTEGER  ilo
        INTEGER  ihi
        REAL  lscale(*)
        REAL  rscale(*)
        REAL  work(*)
        INTEGER  info

        CALL fsggbal(job,
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
