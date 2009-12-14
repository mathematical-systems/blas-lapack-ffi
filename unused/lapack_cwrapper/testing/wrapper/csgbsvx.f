        SUBROUTINE csgbsvx(fact,
     $   trans,
     $   n,
     $   kl,
     $   ku,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   ipiv,
     $   equed,
     $   r,
     $   c,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_sgbsvx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  fact
        CHARACTER  trans
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        INTEGER  nrhs
        REAL  ab(*)
        INTEGER  ldab
        REAL  afb(*)
        INTEGER  ldafb
        INTEGER  ipiv(*)
        CHARACTER  equed
        REAL  r(*)
        REAL  c(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgbsvx(fact,
     $   trans,
     $   n,
     $   kl,
     $   ku,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   ipiv,
     $   equed,
     $   r,
     $   c,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
