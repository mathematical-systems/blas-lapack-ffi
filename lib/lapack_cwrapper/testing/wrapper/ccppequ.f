        SUBROUTINE ccppequ(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   info)
c
c       lapack_cppequ.c
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
        COMPLEX  ap(*)
        REAL  s(*)
        REAL  scond
        REAL  amax
        INTEGER  info

        CALL fcppequ(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   info)
        RETURN
        END
