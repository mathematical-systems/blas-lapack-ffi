        SUBROUTINE czpbcon(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_zpbcon.c
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
        INTEGER  kd
        COMPLEX*16  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzpbcon(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
