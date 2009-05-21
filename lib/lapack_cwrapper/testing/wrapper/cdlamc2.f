        SUBROUTINE cdlamc2(beta,
     $   t,
     $   rnd,
     $   eps,
     $   emin,
     $   rmin,
     $   emax,
     $   rmax)
c
c       lapack_dlamc2.c
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
        INTEGER  t
        LOGICAL  rnd
        DOUBLE PRECISION  eps
        INTEGER  emin
        DOUBLE PRECISION  rmin
        INTEGER  emax
        DOUBLE PRECISION  rmax

        CALL fdlamc2(beta,
     $   t,
     $   rnd,
     $   eps,
     $   emin,
     $   rmin,
     $   emax,
     $   rmax)
        RETURN
        END
