        SUBROUTINE cchseqr(job,
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
c       lapack_chseqr.c
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
        COMPLEX  h(*)
        INTEGER  ldh
        COMPLEX  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fchseqr(job,
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
