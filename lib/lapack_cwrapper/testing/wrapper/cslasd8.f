        SUBROUTINE cslasd8(icompq,
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
c       lapack_slasd8.c
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
        REAL  d(*)
        REAL  z(*)
        REAL  vf(*)
        REAL  vl(*)
        REAL  difl(*)
        REAL  difr(*)
        INTEGER  lddifr
        REAL  dsigma(*)
        REAL  work(*)
        INTEGER  info

        CALL fslasd8(icompq,
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
