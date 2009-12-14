        SUBROUTINE cdlasd4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   sigma,
     $   work,
     $   info)
c
c       lapack_dlasd4.c
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
        DOUBLE PRECISION  sigma
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasd4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   sigma,
     $   work,
     $   info)
        RETURN
        END
