        SUBROUTINE cdlasd5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dsigma,
     $   work)
c
c       lapack_dlasd5.c
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
        DOUBLE PRECISION  dsigma
        DOUBLE PRECISION  work(*)

        CALL fdlasd5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dsigma,
     $   work)
        RETURN
        END
