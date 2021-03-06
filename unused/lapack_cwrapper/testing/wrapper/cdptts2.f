        SUBROUTINE cdptts2(n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb)
c
c       lapack_dptts2.c
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
        INTEGER  nrhs
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb

        CALL fdptts2(n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb)
        RETURN
        END
