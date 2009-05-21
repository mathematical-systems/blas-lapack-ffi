        SUBROUTINE csgetrs(trans,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_sgetrs.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fsgetrs(trans,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
