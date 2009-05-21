        SUBROUTINE czbdsqr(uplo,
     $   n,
     $   ncvt,
     $   nru,
     $   ncc,
     $   d,
     $   e,
     $   vt,
     $   ldvt,
     $   u,
     $   ldu,
     $   c,
     $   ldc,
     $   rwork,
     $   info)
c
c       lapack_zbdsqr.c
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
        INTEGER  n
        INTEGER  ncvt
        INTEGER  nru
        INTEGER  ncc
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  vt(*)
        INTEGER  ldvt
        COMPLEX*16  u(*)
        INTEGER  ldu
        COMPLEX*16  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzbdsqr(uplo,
     $   n,
     $   ncvt,
     $   nru,
     $   ncc,
     $   d,
     $   e,
     $   vt,
     $   ldvt,
     $   u,
     $   ldu,
     $   c,
     $   ldc,
     $   rwork,
     $   info)
        RETURN
        END
