        SUBROUTINE czlatbs(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
c
c       lapack_zlatbs.c
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
        INTEGER  kd
        COMPLEX*16  ab(*)
        INTEGER  ldab
        COMPLEX*16  x(*)
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  cnorm(*)
        INTEGER  info

        CALL fzlatbs(uplo,
     $   trans,
     $   diag,
     $   normin,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   x,
     $   scale,
     $   cnorm,
     $   info)
        RETURN
        END
