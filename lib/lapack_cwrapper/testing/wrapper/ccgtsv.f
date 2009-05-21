        SUBROUTINE ccgtsv(n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_cgtsv.c
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
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)
        COMPLEX  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fcgtsv(n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
