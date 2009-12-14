        SUBROUTINE czgbbrd(vect,
     $   m,
     $   n,
     $   ncc,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   pt,
     $   ldpt,
     $   c,
     $   ldc,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_zgbbrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  vect
        INTEGER  m
        INTEGER  n
        INTEGER  ncc
        INTEGER  kl
        INTEGER  ku
        COMPLEX*16  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  pt(*)
        INTEGER  ldpt
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzgbbrd(vect,
     $   m,
     $   n,
     $   ncc,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   pt,
     $   ldpt,
     $   c,
     $   ldc,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
