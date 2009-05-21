        SUBROUTINE czlaein(rightv,
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
c       lapack_zlaein.c
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
        COMPLEX*16  h(*)
        INTEGER  ldh
        COMPLEX*16  w
        COMPLEX*16  v(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  rwork(*)
        DOUBLE PRECISION  eps3
        DOUBLE PRECISION  smlnum
        INTEGER  info

        CALL fzlaein(rightv,
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
