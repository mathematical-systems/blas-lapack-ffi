        SUBROUTINE cslaed1(n,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_slaed1.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        INTEGER  indxq(*)
        REAL  rho
        INTEGER  cutpnt
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslaed1(n,
     $   d,
     $   q,
     $   ldq,
     $   indxq,
     $   rho,
     $   cutpnt,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
