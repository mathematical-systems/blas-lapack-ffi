        SUBROUTINE cdgbbrd(vect,
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
c       lapack_dgbbrd.c
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
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  pt(*)
        INTEGER  ldpt
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdgbbrd(vect,
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
