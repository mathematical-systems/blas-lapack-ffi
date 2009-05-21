        SUBROUTINE cdhgeqz(job,
     $   compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   t,
     $   ldt,
     $   alphar,
     $   alphai,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dhgeqz.c
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
        CHARACTER  compq
        CHARACTER  compz
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  h(*)
        INTEGER  ldh
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  alphar(*)
        DOUBLE PRECISION  alphai(*)
        DOUBLE PRECISION  beta(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdhgeqz(job,
     $   compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   t,
     $   ldt,
     $   alphar,
     $   alphai,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
