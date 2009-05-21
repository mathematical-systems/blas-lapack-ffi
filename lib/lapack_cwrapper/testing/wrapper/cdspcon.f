        SUBROUTINE cdspcon(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dspcon.c
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
        DOUBLE PRECISION  ap(*)
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdspcon(uplo,
     $   n,
     $   ap,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
