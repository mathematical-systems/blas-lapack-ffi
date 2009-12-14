        SUBROUTINE cstrexc(compq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   ifst,
     $   ilst,
     $   work,
     $   info)
c
c       lapack_strexc.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  compq
        INTEGER  n
        REAL  t(*)
        INTEGER  ldt
        REAL  q(*)
        INTEGER  ldq
        INTEGER  ifst
        INTEGER  ilst
        REAL  work(*)
        INTEGER  info

        CALL fstrexc(compq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   ifst,
     $   ilst,
     $   work,
     $   info)
        RETURN
        END
