        SUBROUTINE cdtbcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dtbcon.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        CHARACTER  uplo
        CHARACTER  diag
        INTEGER  n
        INTEGER  kd
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdtbcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
