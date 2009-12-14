        SUBROUTINE cdlamc4(emin,
     $   start,
     $   base)
c
c       lapack_dlamc4.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  emin
        DOUBLE PRECISION  start
        INTEGER  base

        CALL fdlamc4(emin,
     $   start,
     $   base)
        RETURN
        END
