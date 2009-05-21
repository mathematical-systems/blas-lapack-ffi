        SUBROUTINE czgbsv(n,
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
c       lapack_zgbsv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        INTEGER  nrhs
        COMPLEX*16  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzgbsv(n,
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
