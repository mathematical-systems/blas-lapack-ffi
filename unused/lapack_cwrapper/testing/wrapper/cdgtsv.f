        SUBROUTINE cdgtsv(n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_dgtsv.c
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
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fdgtsv(n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
