        SUBROUTINE czpbrfs(uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_zpbrfs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  n
        INTEGER  kd
        INTEGER  nrhs
        DOUBLE PRECISION  ab(*)
        INTEGER  ldab
        COMPLEX*16  afb(*)
        INTEGER  ldafb
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzpbrfs(uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
