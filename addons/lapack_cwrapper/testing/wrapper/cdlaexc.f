        SUBROUTINE cdlaexc(wantq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   j1,
     $   n1,
     $   n2,
     $   work,
     $   info)
c
c       lapack_dlaexc.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  wantq
        INTEGER  n
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        INTEGER  j1
        INTEGER  n1
        INTEGER  n2
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlaexc(wantq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   j1,
     $   n1,
     $   n2,
     $   work,
     $   info)
        RETURN
        END
