        SUBROUTINE cslaed4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam,
     $   info)
c
c       lapack_slaed4.c
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
        REAL  d(*)
        REAL  z(*)
        REAL  delta(*)
        REAL  rho
        REAL  dlam
        INTEGER  info

        CALL fslaed4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam,
     $   info)
        RETURN
        END
