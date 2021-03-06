        SUBROUTINE cspbcon(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_spbcon.c
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
        REAL  ab(*)
        INTEGER  ldab
        REAL  anorm
        REAL  rcond
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fspbcon(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
