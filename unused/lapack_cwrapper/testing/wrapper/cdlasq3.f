        SUBROUTINE cdlasq3(i0,
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
     $   ttype,
     $   ieee)
c
c       lapack_dlasq3.c
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
        INTEGER  ttype
        LOGICAL  ieee

        CALL fdlasq3(i0,
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
     $   ttype,
     $   ieee)
        RETURN
        END
