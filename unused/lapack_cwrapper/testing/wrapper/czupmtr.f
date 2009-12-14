        SUBROUTINE czupmtr(side,
     $   uplo,
     $   trans,
     $   m,
     $   n,
     $   ap,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   info)
c
c       lapack_zupmtr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        CHARACTER  uplo
        CHARACTER  trans
        INTEGER  m
        INTEGER  n
        COMPLEX*16  ap(*)
        COMPLEX*16  tau(*)
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzupmtr(side,
     $   uplo,
     $   trans,
     $   m,
     $   n,
     $   ap,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   info)
        RETURN
        END
