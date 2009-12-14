        SUBROUTINE cslaed9(k,
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
c       lapack_slaed9.c
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
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  rho
        REAL  dlamda(*)
        REAL  w(*)
        REAL  s(*)
        INTEGER  lds
        INTEGER  info

        CALL fslaed9(k,
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
