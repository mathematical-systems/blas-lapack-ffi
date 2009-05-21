        SUBROUTINE cshseqr(job,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_shseqr.c
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
        CHARACTER  compz
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        REAL  h(*)
        INTEGER  ldh
        REAL  wr(*)
        REAL  wi(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fshseqr(job,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
