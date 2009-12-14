        SUBROUTINE csgels(trans,
     $   m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_sgels.c
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
        INTEGER  m
        INTEGER  n
        INTEGER  nrhs
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsgels(trans,
     $   m,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
