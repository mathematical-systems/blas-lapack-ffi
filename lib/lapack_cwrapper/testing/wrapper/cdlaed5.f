        SUBROUTINE cdlaed5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam)
c
c       lapack_dlaed5.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  i
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  delta(*)
        DOUBLE PRECISION  rho
        DOUBLE PRECISION  dlam

        CALL fdlaed5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam)
        RETURN
        END
