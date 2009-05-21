        SUBROUTINE cdlaebz(ijob,
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
c       lapack_dlaebz.c
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
        DOUBLE PRECISION  abstol
        DOUBLE PRECISION  reltol
        DOUBLE PRECISION  pivmin
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  e2(*)
        INTEGER  nval(*)
        DOUBLE PRECISION  ab(*)
        DOUBLE PRECISION  c(*)
        INTEGER  mout
        INTEGER  nab(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdlaebz(ijob,
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
