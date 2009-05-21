        SUBROUTINE cshgeqz(job,
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
c       lapack_shgeqz.c
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
        REAL  h(*)
        INTEGER  ldh
        REAL  t(*)
        INTEGER  ldt
        REAL  alphar(*)
        REAL  alphai(*)
        REAL  beta(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fshgeqz(job,
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
