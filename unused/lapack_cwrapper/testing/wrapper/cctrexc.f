        SUBROUTINE cctrexc(compq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   ifst,
     $   ilst,
     $   info)
c
c       lapack_ctrexc.c
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
        COMPLEX  t(*)
        INTEGER  ldt
        COMPLEX  q(*)
        INTEGER  ldq
        INTEGER  ifst
        INTEGER  ilst
        INTEGER  info

        CALL fctrexc(compq,
     $   n,
     $   t,
     $   ldt,
     $   q,
     $   ldq,
     $   ifst,
     $   ilst,
     $   info)
        RETURN
        END
