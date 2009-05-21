        SUBROUTINE cslasq4(i0,
     $   n0,
     $   z,
     $   pp,
     $   n0in,
     $   dmin,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dn1,
     $   dn2,
     $   tau,
     $   ttype)
c
c       lapack_slasq4.c
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
        INTEGER  n0in
        REAL  dmin
        REAL  dmin1
        REAL  dmin2
        REAL  dn
        REAL  dn1
        REAL  dn2
        REAL  tau
        INTEGER  ttype

        CALL fslasq4(i0,
     $   n0,
     $   z,
     $   pp,
     $   n0in,
     $   dmin,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dn1,
     $   dn2,
     $   tau,
     $   ttype)
        RETURN
        END
