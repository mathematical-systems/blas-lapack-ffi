        SUBROUTINE cdlaed4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam,
     $   info)
c
c       lapack_dlaed4.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  i
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  delta(*)
        DOUBLE PRECISION  rho
        DOUBLE PRECISION  dlam
        INTEGER  info

        CALL fdlaed4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam,
     $   info)
        RETURN
        END
