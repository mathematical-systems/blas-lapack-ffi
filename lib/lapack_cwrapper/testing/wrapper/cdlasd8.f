        SUBROUTINE cdlasd8(icompq,
     $   k,
     $   d,
     $   z,
     $   vf,
     $   vl,
     $   difl,
     $   difr,
     $   lddifr,
     $   dsigma,
     $   work,
     $   info)
c
c       lapack_dlasd8.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  icompq
        INTEGER  k
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  vf(*)
        DOUBLE PRECISION  vl(*)
        DOUBLE PRECISION  difl(*)
        DOUBLE PRECISION  difr(*)
        INTEGER  lddifr
        DOUBLE PRECISION  dsigma(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasd8(icompq,
     $   k,
     $   d,
     $   z,
     $   vf,
     $   vl,
     $   difl,
     $   difr,
     $   lddifr,
     $   dsigma,
     $   work,
     $   info)
        RETURN
        END
