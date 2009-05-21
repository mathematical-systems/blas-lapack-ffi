        SUBROUTINE cslaebz(ijob,
     $   nitmax,
     $   n,
     $   mmax,
     $   minp,
     $   nbmin,
     $   abstol,
     $   reltol,
     $   pivmin,
     $   d,
     $   e,
     $   e2,
     $   nval,
     $   ab,
     $   c,
     $   mout,
     $   nab,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_slaebz.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  ijob
        INTEGER  nitmax
        INTEGER  n
        INTEGER  mmax
        INTEGER  minp
        INTEGER  nbmin
        REAL  abstol
        REAL  reltol
        REAL  pivmin
        REAL  d(*)
        REAL  e(*)
        REAL  e2(*)
        INTEGER  nval(*)
        REAL  ab(*)
        REAL  c(*)
        INTEGER  mout
        INTEGER  nab(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fslaebz(ijob,
     $   nitmax,
     $   n,
     $   mmax,
     $   minp,
     $   nbmin,
     $   abstol,
     $   reltol,
     $   pivmin,
     $   d,
     $   e,
     $   e2,
     $   nval,
     $   ab,
     $   c,
     $   mout,
     $   nab,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
