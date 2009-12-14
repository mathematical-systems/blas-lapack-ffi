        SUBROUTINE cdgtts2(itrans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb)
c
c       lapack_dgtts2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itrans
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  du2(*)
        INTEGER  ipiv(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb

        CALL fdgtts2(itrans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   b,
     $   ldb)
        RETURN
        END
