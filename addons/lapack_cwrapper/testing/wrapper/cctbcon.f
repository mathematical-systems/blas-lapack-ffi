        SUBROUTINE cctbcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ctbcon.c
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
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  rcond
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fctbcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
