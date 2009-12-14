        SUBROUTINE cslaed6(kniter,
     $   orgati,
     $   rho,
     $   d,
     $   z,
     $   finit,
     $   tau,
     $   info)
c
c       lapack_slaed6.c
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
        REAL  rho
        REAL  d(*)
        REAL  z(*)
        REAL  finit
        REAL  tau
        INTEGER  info

        CALL fslaed6(kniter,
     $   orgati,
     $   rho,
     $   d,
     $   z,
     $   finit,
     $   tau,
     $   info)
        RETURN
        END
