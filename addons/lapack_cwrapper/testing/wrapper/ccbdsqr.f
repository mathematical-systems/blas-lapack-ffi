        SUBROUTINE ccbdsqr(uplo,
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
c       lapack_cbdsqr.c
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
        REAL  d(*)
        REAL  e(*)
        COMPLEX  vt(*)
        INTEGER  ldvt
        COMPLEX  u(*)
        INTEGER  ldu
        COMPLEX  c(*)
        INTEGER  ldc
        REAL  rwork(*)
        INTEGER  info

        CALL fcbdsqr(uplo,
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
