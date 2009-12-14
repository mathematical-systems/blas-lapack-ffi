        SUBROUTINE cslaexc(wantq,
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
c       lapack_slaexc.c
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
        REAL  t(*)
        INTEGER  ldt
        REAL  q(*)
        INTEGER  ldq
        INTEGER  j1
        INTEGER  n1
        INTEGER  n2
        REAL  work(*)
        INTEGER  info

        CALL fslaexc(wantq,
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
