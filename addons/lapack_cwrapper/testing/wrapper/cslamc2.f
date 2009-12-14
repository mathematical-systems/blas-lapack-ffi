        SUBROUTINE cslamc2(beta,
     $   t,
     $   rnd,
     $   eps,
     $   emin,
     $   rmin,
     $   emax,
     $   rmax)
c
c       lapack_slamc2.c
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
        REAL  eps
        INTEGER  emin
        REAL  rmin
        INTEGER  emax
        REAL  rmax

        CALL fslamc2(beta,
     $   t,
     $   rnd,
     $   eps,
     $   emin,
     $   rmin,
     $   emax,
     $   rmax)
        RETURN
        END
