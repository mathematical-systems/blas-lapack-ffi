        SUBROUTINE ccgbbrd(vect,
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
c       lapack_cgbbrd.c
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
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  d(*)
        REAL  e(*)
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  pt(*)
        INTEGER  ldpt
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcgbbrd(vect,
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
