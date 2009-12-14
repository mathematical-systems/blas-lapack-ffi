        SUBROUTINE csgbbrd(vect,
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
     $   info)
c
c       lapack_sgbbrd.c
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
        REAL  ab(*)
        INTEGER  ldab
        REAL  d(*)
        REAL  e(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  pt(*)
        INTEGER  ldpt
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)
        INTEGER  info

        CALL fsgbbrd(vect,
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
     $   info)
        RETURN
        END
