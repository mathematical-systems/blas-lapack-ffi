        SUBROUTINE czgttrf(n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   info)
c
c       lapack_zgttrf.c
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
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)
        COMPLEX*16  du2(*)
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fzgttrf(n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   info)
        RETURN
        END
