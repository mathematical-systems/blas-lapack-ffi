        SUBROUTINE cdlatps(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   ap,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
c
c       lapack_dlatps.c
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
        CHARACTER  trans
        CHARACTER  diag
        CHARACTER  normin
        INTEGER  n
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  cnorm(*)
        INTEGER  info

        CALL fdlatps(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   ap,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
        RETURN
        END
