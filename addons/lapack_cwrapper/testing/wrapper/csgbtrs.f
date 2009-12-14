        SUBROUTINE csgbtrs(trans,
     $   n,
     $   kl,
     $   ku,
     $   nrhs,
     $   ab,
     $   ldab,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_sgbtrs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trans
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        INTEGER  nrhs
        REAL  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        REAL  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fsgbtrs(trans,
     $   n,
     $   kl,
     $   ku,
     $   nrhs,
     $   ab,
     $   ldab,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
