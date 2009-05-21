        SUBROUTINE cslaed5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam)
c
c       lapack_slaed5.c
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
        REAL  d(*)
        REAL  z(*)
        REAL  delta(*)
        REAL  rho
        REAL  dlam

        CALL fslaed5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dlam)
        RETURN
        END
