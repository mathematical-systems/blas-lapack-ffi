        SUBROUTINE ccgttrs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_cgttrs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trans
        INTEGER  n
        INTEGER  nrhs
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)
        COMPLEX  du2(*)
        INTEGER  ipiv(*)
        COMPLEX  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fcgttrs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
