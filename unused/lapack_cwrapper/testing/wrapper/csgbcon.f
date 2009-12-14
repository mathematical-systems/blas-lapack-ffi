        SUBROUTINE csgbcon(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_sgbcon.c
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
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        REAL  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        REAL  anorm
        REAL  rcond
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgbcon(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
