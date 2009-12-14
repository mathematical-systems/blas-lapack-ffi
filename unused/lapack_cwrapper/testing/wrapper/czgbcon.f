        SUBROUTINE czgbcon(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_zgbcon.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzgbcon(norm,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
