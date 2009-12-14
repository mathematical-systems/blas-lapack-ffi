        SUBROUTINE cslaed3(k,
     $   n,
     $   n1,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   dlamda,
     $   q2,
     $   indx,
     $   ctot,
     $   w,
     $   s,
     $   lds,
     $   info)
c
c       lapack_slaed3.c
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
        INTEGER  n
        INTEGER  n1
        REAL  d(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  rho
        REAL  dlamda(*)
        REAL  q2(*)
        INTEGER  indx(*)
        INTEGER  ctot(*)
        REAL  w(*)
        REAL  s(*)
        INTEGER  lds
        INTEGER  info

        CALL fslaed3(k,
     $   n,
     $   n1,
     $   d,
     $   q,
     $   ldq,
     $   rho,
     $   dlamda,
     $   q2,
     $   indx,
     $   ctot,
     $   w,
     $   s,
     $   lds,
     $   info)
        RETURN
        END
