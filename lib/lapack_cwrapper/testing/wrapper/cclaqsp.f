        SUBROUTINE cclaqsp(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   equed)
c
c       lapack_claqsp.c
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
        CHARACTER  equed

        CALL fclaqsp(uplo,
     $   n,
     $   ap,
     $   s,
     $   scond,
     $   amax,
     $   equed)
        RETURN
        END
