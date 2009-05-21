        SUBROUTINE ccptts2(iuplo,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb)
c
c       lapack_cptts2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  iuplo
        INTEGER  n
        INTEGER  nrhs
        REAL  d(*)
        COMPLEX  e(*)
        REAL  b(*)
        INTEGER  ldb

        CALL fcptts2(iuplo,
     $   n,
     $   nrhs,
     $   d,
     $   e,
     $   b,
     $   ldb)
        RETURN
        END
