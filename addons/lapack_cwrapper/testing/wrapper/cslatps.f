        SUBROUTINE cslatps(uplo,
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
c       lapack_slatps.c
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
        REAL  ap(*)
        REAL  x(*)
        REAL  scale
        REAL  cnorm(*)
        INTEGER  info

        CALL fslatps(uplo,
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
