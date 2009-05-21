        SUBROUTINE cdlasq5(i0,
     $   n0,
     $   z,
     $   pp,
     $   tau,
     $   dmin,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dnm1,
     $   dnm2,
     $   ieee)
c
c       lapack_dlasq5.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  i0
        INTEGER  n0
        DOUBLE PRECISION  z(*)
        INTEGER  pp
        DOUBLE PRECISION  tau
        DOUBLE PRECISION  dmin
        DOUBLE PRECISION  dmin1
        DOUBLE PRECISION  dmin2
        DOUBLE PRECISION  dn
        DOUBLE PRECISION  dnm1
        DOUBLE PRECISION  dnm2
        LOGICAL  ieee

        CALL fdlasq5(i0,
     $   n0,
     $   z,
     $   pp,
     $   tau,
     $   dmin,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dnm1,
     $   dnm2,
     $   ieee)
        RETURN
        END
