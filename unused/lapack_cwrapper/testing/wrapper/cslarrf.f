        SUBROUTINE cslarrf(n,
     $   d,
     $   l,
     $   ld,
     $   lld,
     $   ifirst,
     $   ilast,
     $   w,
     $   sigma,
     $   dplus,
     $   lplus,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_slarrf.c
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
        REAL  d(*)
        REAL  l(*)
        REAL  ld(*)
        REAL  lld(*)
        INTEGER  ifirst
        INTEGER  ilast
        REAL  w(*)
        REAL  sigma
        REAL  dplus(*)
        REAL  lplus(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslarrf(n,
     $   d,
     $   l,
     $   ld,
     $   lld,
     $   ifirst,
     $   ilast,
     $   w,
     $   sigma,
     $   dplus,
     $   lplus,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
