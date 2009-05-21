        SUBROUTINE cdgttrf(n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   info)
c
c       lapack_dgttrf.c
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
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  du2(*)
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fdgttrf(n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   info)
        RETURN
        END
