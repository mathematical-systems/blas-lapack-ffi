        SUBROUTINE czgbequ(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   info)
c
c       lapack_zgbequ.c
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
        DOUBLE PRECISION  r(*)
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  rowcnd
        DOUBLE PRECISION  colcnd
        DOUBLE PRECISION  amax
        INTEGER  info

        CALL fzgbequ(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   info)
        RETURN
        END
