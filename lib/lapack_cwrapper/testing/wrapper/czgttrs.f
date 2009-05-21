        SUBROUTINE czgttrs(trans,
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
c       lapack_zgttrs.c
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
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)
        COMPLEX*16  du2(*)
        INTEGER  ipiv(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzgttrs(trans,
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
