        SUBROUTINE cspbsv(uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_spbsv.c
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
        INTEGER  nrhs
        REAL  ab(*)
        INTEGER  ldab
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fspbsv(uplo,
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
