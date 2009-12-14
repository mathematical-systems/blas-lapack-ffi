        SUBROUTINE cdlaed9(k,
     $   kstart,
     $   kstop,
     $   n,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   dlamda,
     $   w,
     $   s,
     $   lds,
     $   info)
c
c       lapack_dlaed9.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  k
        INTEGER  kstart
        INTEGER  kstop
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  rho
        DOUBLE PRECISION  dlamda(*)
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  s(*)
        INTEGER  lds
        INTEGER  info

        CALL fdlaed9(k,
     $   kstart,
     $   kstop,
     $   n,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   dlamda,
     $   w,
     $   s,
     $   lds,
     $   info)
        RETURN
        END
