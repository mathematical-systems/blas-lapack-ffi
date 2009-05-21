        SUBROUTINE czhgeqz(job,
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
c       lapack_zhgeqz.c
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
        COMPLEX*16  h(*)
        INTEGER  ldh
        COMPLEX*16  t(*)
        INTEGER  ldt
        COMPLEX*16  alpha(*)
        COMPLEX*16  beta(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  z(*)
        INTEGER  ldz
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzhgeqz(job,
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
