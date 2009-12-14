        SUBROUTINE cstbcon(norm,
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
c       lapack_stbcon.c
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
        REAL  ab(*)
        INTEGER  ldab
        REAL  rcond
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fstbcon(norm,
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
