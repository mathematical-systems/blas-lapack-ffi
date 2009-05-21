        SUBROUTINE cclaed0(qsiz,
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
c       lapack_claed0.c
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
        REAL  d(*)
        REAL  e(*)
        COMPLEX  q(*)
        INTEGER  ldq
        INTEGER  iwork(*)
        REAL  rwork(*)
        COMPLEX  qstore(*)
        INTEGER  ldqs
        INTEGER  info

        CALL fclaed0(qsiz,
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
