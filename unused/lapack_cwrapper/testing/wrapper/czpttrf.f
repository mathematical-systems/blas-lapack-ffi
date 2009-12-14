        SUBROUTINE czpttrf(n,
     $   d,
     $   e,
     $   info)
c
c       lapack_zpttrf.c
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
        DOUBLE PRECISION  d(*)
        COMPLEX*16  e(*)
        INTEGER  info

        CALL fzpttrf(n,
     $   d,
     $   e,
     $   info)
        RETURN
        END
