        SUBROUTINE ccgels(trans,
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
c       lapack_cgels.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcgels(trans,
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
