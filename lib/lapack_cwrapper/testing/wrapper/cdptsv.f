        SUBROUTINE cdptsv(n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_dptsv.c
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
        INTEGER  info

        CALL fdptsv(n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
