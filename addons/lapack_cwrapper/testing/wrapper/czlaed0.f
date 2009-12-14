        SUBROUTINE czlaed0(qsiz,
     $   n,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   iwork,
     $   rwork,
     $   qstore,
     $   ldqs,
     $   info)
c
c       lapack_zlaed0.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  qsiz
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        DOUBLE PRECISION  rwork(*)
        COMPLEX*16  qstore(*)
        INTEGER  ldqs
        INTEGER  info

        CALL fzlaed0(qsiz,
     $   n,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   iwork,
     $   rwork,
     $   qstore,
     $   ldqs,
     $   info)
        RETURN
        END
