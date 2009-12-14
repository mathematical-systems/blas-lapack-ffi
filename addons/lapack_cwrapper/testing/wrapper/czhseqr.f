        SUBROUTINE czhseqr(job,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_zhseqr.c
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
        COMPLEX*16  h(*)
        INTEGER  ldh
        COMPLEX*16  w(*)
        COMPLEX*16  z(*)
        INTEGER  ldz
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzhseqr(job,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
