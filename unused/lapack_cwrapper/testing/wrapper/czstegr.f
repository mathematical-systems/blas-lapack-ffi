        SUBROUTINE czstegr(jobz,
     $   range,
     $   n,
     $   d,
     $   e,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   m,
     $   w,
     $   z,
     $   ldz,
     $   isuppz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_zstegr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        CHARACTER  range
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  vl
        DOUBLE PRECISION  vu
        INTEGER  il
        INTEGER  iu
        DOUBLE PRECISION  abstol
        INTEGER  m
        DOUBLE PRECISION  w(*)
        COMPLEX*16  z(*)
        INTEGER  ldz
        INTEGER  isuppz(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fzstegr(jobz,
     $   range,
     $   n,
     $   d,
     $   e,
     $   vl,
     $   vu,
     $   il,
     $   iu,
     $   abstol,
     $   m,
     $   w,
     $   z,
     $   ldz,
     $   isuppz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
