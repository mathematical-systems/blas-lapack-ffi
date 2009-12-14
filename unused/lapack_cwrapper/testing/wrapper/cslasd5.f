        SUBROUTINE cslasd5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dsigma,
     $   work)
c
c       lapack_slasd5.c
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
        REAL  dsigma
        REAL  work(*)

        CALL fslasd5(i,
     $   d,
     $   z,
     $   delta,
     $   rho,
     $   dsigma,
     $   work)
        RETURN
        END
