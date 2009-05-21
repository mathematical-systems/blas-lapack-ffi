        SUBROUTINE cdlasq4(i0,
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
c       lapack_dlasq4.c
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
        INTEGER  n0in
        DOUBLE PRECISION  dmin
        DOUBLE PRECISION  dmin1
        DOUBLE PRECISION  dmin2
        DOUBLE PRECISION  dn
        DOUBLE PRECISION  dn1
        DOUBLE PRECISION  dn2
        DOUBLE PRECISION  tau
        INTEGER  ttype

        CALL fdlasq4(i0,
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
