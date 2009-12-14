        SUBROUTINE cslasq5(i0,
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
c       lapack_slasq5.c
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
        REAL  z(*)
        INTEGER  pp
        REAL  tau
        REAL  dmin
        REAL  dmin1
        REAL  dmin2
        REAL  dn
        REAL  dnm1
        REAL  dnm2
        LOGICAL  ieee

        CALL fslasq5(i0,
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
