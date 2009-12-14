        SUBROUTINE cdgbcon(norm,
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
c       lapack_dgbcon.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgbcon(norm,
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
