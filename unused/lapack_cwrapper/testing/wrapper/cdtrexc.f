        SUBROUTINE cdtrexc(compq,
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
c       lapack_dtrexc.c
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
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        INTEGER  ifst
        INTEGER  ilst
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdtrexc(compq,
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
