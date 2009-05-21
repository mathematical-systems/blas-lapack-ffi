        SUBROUTINE cslaed0(icompq,
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
c       lapack_slaed0.c
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
        REAL  d(*)
        REAL  e(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  qstore(*)
        INTEGER  ldqs
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslaed0(icompq,
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
