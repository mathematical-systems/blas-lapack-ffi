        SUBROUTINE czppequ(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   info)
c
c       lapack_zppequ.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  n
        COMPLEX*16  ap(*)
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  scond
        DOUBLE PRECISION  amax
        INTEGER  info

        CALL fzppequ(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   info)
        RETURN
        END
