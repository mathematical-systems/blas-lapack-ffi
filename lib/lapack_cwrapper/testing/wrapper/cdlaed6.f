        SUBROUTINE cdlaed6(kniter,
     $   orgati,
     $   rho,
     $   d,
     $   z,
     $   finit,
     $   tau,
     $   info)
c
c       lapack_dlaed6.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  kniter
        LOGICAL  orgati
        DOUBLE PRECISION  rho
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  finit
        DOUBLE PRECISION  tau
        INTEGER  info

        CALL fdlaed6(kniter,
     $   orgati,
     $   rho,
     $   d,
     $   z,
     $   finit,
     $   tau,
     $   info)
        RETURN
        END
