        SUBROUTINE cdgbtrs(trans,
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
c       lapack_dgbtrs.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fdgbtrs(trans,
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
