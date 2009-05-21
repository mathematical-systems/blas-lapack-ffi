        SUBROUTINE csbdsqr(uplo,
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
     $   work,
     $   info)
c
c       lapack_sbdsqr.c
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
        REAL  vt(*)
        INTEGER  ldvt
        REAL  u(*)
        INTEGER  ldu
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)
        INTEGER  info

        CALL fsbdsqr(uplo,
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
     $   work,
     $   info)
        RETURN
        END
