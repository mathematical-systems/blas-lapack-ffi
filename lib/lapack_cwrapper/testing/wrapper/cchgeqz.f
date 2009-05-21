        SUBROUTINE cchgeqz(job,
     $   compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   t,
     $   ldt,
     $   alpha,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_chgeqz.c
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
        COMPLEX  h(*)
        INTEGER  ldh
        COMPLEX  t(*)
        INTEGER  ldt
        COMPLEX  alpha(*)
        COMPLEX  beta(*)
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fchgeqz(job,
     $   compq,
     $   compz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   t,
     $   ldt,
     $   alpha,
     $   beta,
     $   q,
     $   ldq,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
