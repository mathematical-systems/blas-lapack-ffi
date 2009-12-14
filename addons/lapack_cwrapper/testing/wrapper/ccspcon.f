        SUBROUTINE ccspcon(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
c
c       lapack_cspcon.c
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
        INTEGER  ipiv(*)
        REAL  anorm
        REAL  rcond
        COMPLEX  work(*)
        INTEGER  info

        CALL fcspcon(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
        RETURN
        END
