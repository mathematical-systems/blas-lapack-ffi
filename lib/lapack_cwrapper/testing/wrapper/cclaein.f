        SUBROUTINE cclaein(rightv,
     $   noinit,
     $   n,
     $   h,
     $   ldh,
     $   w,
     $   v,
     $   b,
     $   ldb,
     $   rwork,
     $   eps3,
     $   smlnum,
     $   info)
c
c       lapack_claein.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  rightv
        LOGICAL  noinit
        INTEGER  n
        COMPLEX  h(*)
        INTEGER  ldh
        COMPLEX  w
        COMPLEX  v(*)
        COMPLEX  b(*)
        INTEGER  ldb
        REAL  rwork(*)
        REAL  eps3
        REAL  smlnum
        INTEGER  info

        CALL fclaein(rightv,
     $   noinit,
     $   n,
     $   h,
     $   ldh,
     $   w,
     $   v,
     $   b,
     $   ldb,
     $   rwork,
     $   eps3,
     $   smlnum,
     $   info)
        RETURN
        END
