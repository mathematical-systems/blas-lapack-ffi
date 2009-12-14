        SUBROUTINE cdlazq3(i0,
     $   n0,
     $   z,
     $   pp,
     $   dmin,
     $   sigma,
     $   desig,
     $   qmax,
     $   nfail,
     $   iter,
     $   ndiv,
     $   ieee,
     $   ttype,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dn1,
     $   dn2,
     $   tau)
c
c       lapack_dlazq3.c
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
        DOUBLE PRECISION  dmin
        DOUBLE PRECISION  sigma
        DOUBLE PRECISION  desig
        DOUBLE PRECISION  qmax
        INTEGER  nfail
        INTEGER  iter
        INTEGER  ndiv
        LOGICAL  ieee
        INTEGER  ttype
        REAL  dmin1
        REAL  dmin2
        REAL  dn
        REAL  dn1
        REAL  dn2
        REAL  tau

        CALL fdlazq3(i0,
     $   n0,
     $   z,
     $   pp,
     $   dmin,
     $   sigma,
     $   desig,
     $   qmax,
     $   nfail,
     $   iter,
     $   ndiv,
     $   ieee,
     $   ttype,
     $   dmin1,
     $   dmin2,
     $   dn,
     $   dn1,
     $   dn2,
     $   tau)
        RETURN
        END
