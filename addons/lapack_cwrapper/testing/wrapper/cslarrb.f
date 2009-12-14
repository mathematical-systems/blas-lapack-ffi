        SUBROUTINE cslarrb(n,
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
c       lapack_slarrb.c
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
        REAL  sigma
        REAL  reltol
        REAL  w(*)
        REAL  wgap(*)
        REAL  werr(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslarrb(n,
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
