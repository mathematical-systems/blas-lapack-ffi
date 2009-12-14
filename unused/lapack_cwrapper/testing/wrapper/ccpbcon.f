        SUBROUTINE ccpbcon(uplo,
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
c       lapack_cpbcon.c
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
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  anorm
        REAL  rcond
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcpbcon(uplo,
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
