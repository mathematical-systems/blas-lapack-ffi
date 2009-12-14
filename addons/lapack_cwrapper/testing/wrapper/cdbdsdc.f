        SUBROUTINE cdbdsdc(uplo,
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
c       lapack_dbdsdc.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        DOUBLE PRECISION  q(*)
        INTEGER  iq(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdbdsdc(uplo,
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
