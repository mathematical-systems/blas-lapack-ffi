        SUBROUTINE ccstegr(jobz,
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
c       lapack_cstegr.c
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
        REAL  d(*)
        REAL  e(*)
        REAL  vl
        REAL  vu
        INTEGER  il
        INTEGER  iu
        REAL  abstol
        INTEGER  m
        REAL  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        INTEGER  isuppz(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fcstegr(jobz,
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
