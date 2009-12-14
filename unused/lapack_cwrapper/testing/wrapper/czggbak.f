        SUBROUTINE czggbak(job,
     $   side,
     $   n,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   m,
     $   v,
     $   ldv,
     $   info)
c
c       lapack_zggbak.c
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
        CHARACTER  side
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  lscale(*)
        DOUBLE PRECISION  rscale(*)
        INTEGER  m
        COMPLEX*16  v(*)
        INTEGER  ldv
        INTEGER  info

        CALL fzggbak(job,
     $   side,
     $   n,
     $   ilo,
     $   ihi,
     $   lscale,
     $   rscale,
     $   m,
     $   v,
     $   ldv,
     $   info)
        RETURN
        END
