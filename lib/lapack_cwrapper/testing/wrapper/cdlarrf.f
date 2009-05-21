        SUBROUTINE cdlarrf(n,
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
c       lapack_dlarrf.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  l(*)
        DOUBLE PRECISION  ld(*)
        DOUBLE PRECISION  lld(*)
        INTEGER  ifirst
        INTEGER  ilast
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  sigma
        DOUBLE PRECISION  dplus(*)
        DOUBLE PRECISION  lplus(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlarrf(n,
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
