        SUBROUTINE cdlaed0(icompq,
     $   qsiz,
     $   n,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   qstore,
     $   ldqs,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dlaed0.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  icompq
        INTEGER  qsiz
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  qstore(*)
        INTEGER  ldqs
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlaed0(icompq,
     $   qsiz,
     $   n,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   qstore,
     $   ldqs,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
