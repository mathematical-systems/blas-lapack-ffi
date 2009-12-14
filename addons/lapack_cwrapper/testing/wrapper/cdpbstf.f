        SUBROUTINE cdpbstf(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   info)
c
c       lapack_dpbstf.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        INTEGER  info

        CALL fdpbstf(uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   info)
        RETURN
        END
