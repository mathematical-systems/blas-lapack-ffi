        SUBROUTINE cdlarrb(n,
     $   d,
     $   l,
     $   ld,
     $   lld,
     $   ifirst,
     $   ilast,
     $   sigma,
     $   reltol,
     $   w,
     $   wgap,
     $   werr,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dlarrb.c
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
        DOUBLE PRECISION  sigma
        DOUBLE PRECISION  reltol
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  wgap(*)
        DOUBLE PRECISION  werr(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlarrb(n,
     $   d,
     $   l,
     $   ld,
     $   lld,
     $   ifirst,
     $   ilast,
     $   sigma,
     $   reltol,
     $   w,
     $   wgap,
     $   werr,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
