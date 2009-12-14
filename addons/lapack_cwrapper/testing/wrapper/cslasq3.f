        SUBROUTINE cslasq3(i0,
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
c       lapack_slasq3.c
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
        REAL  dmin
        REAL  sigma
        REAL  desig
        REAL  qmax
        INTEGER  nfail
        INTEGER  iter
        INTEGER  ndiv
        INTEGER  ttype
        LOGICAL  ieee

        CALL fslasq3(i0,
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
