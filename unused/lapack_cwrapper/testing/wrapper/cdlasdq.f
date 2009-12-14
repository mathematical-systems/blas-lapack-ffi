        SUBROUTINE cdlasdq(uplo,
     $   sqre,
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
c       lapack_dlasdq.c
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
        INTEGER  sqre
        INTEGER  n
        INTEGER  ncvt
        INTEGER  nru
        INTEGER  ncc
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  vt(*)
        INTEGER  ldvt
        DOUBLE PRECISION  u(*)
        INTEGER  ldu
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasdq(uplo,
     $   sqre,
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
