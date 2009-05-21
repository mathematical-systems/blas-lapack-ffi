        SUBROUTINE czgbtrf(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   info)
c
c       lapack_zgbtrf.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        COMPLEX*16  ab(*)
        INTEGER  ldab
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fzgbtrf(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   ipiv,
     $   info)
        RETURN
        END
