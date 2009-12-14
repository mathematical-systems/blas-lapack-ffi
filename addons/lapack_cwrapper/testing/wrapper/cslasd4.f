        SUBROUTINE cslasd4(n,
     $   i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   sigma,
     $   work,
     $   info)
c
c       lapack_slasd4.c
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
        REAL  sigma
        REAL  work(*)
        INTEGER  info

        CALL fslasd4(n,
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
