        SUBROUTINE csbdsdc(uplo,
     $   compq,
     $   n,
     $   d,
     $   e,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   q,
     $   iq,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_sbdsdc.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        CHARACTER  compq
        INTEGER  n
        REAL  d(*)
        REAL  e(*)
        REAL  u(*)
        INTEGER  ldu
        REAL  vt(*)
        INTEGER  ldvt
        REAL  q(*)
        INTEGER  iq(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsbdsdc(uplo,
     $   compq,
     $   n,
     $   d,
     $   e,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   q,
     $   iq,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
