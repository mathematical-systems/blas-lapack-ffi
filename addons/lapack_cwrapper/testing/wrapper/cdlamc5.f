        SUBROUTINE cdlamc5(beta,
     $   p,
     $   emin,
     $   ieee,
     $   emax,
     $   rmax)
c
c       lapack_dlamc5.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  beta
        INTEGER  p
        INTEGER  emin
        LOGICAL  ieee
        INTEGER  emax
        DOUBLE PRECISION  rmax

        CALL fdlamc5(beta,
     $   p,
     $   emin,
     $   ieee,
     $   emax,
     $   rmax)
        RETURN
        END
