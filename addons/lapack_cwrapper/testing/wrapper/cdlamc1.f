        SUBROUTINE cdlamc1(beta,
     $   t,
     $   rnd,
     $   ieee1)
c
c       lapack_dlamc1.c
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
        LOGICAL  ieee1

        CALL fdlamc1(beta,
     $   t,
     $   rnd,
     $   ieee1)
        RETURN
        END
