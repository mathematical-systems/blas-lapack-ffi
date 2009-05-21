        SUBROUTINE cztbtrs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_ztbtrs.c
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
        INTEGER  n
        INTEGER  kd
        INTEGER  nrhs
        COMPLEX*16  ab(*)
        INTEGER  ldab
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fztbtrs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
