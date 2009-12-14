        SUBROUTINE cdopmtr(side,
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
c       lapack_dopmtr.c
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
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdopmtr(side,
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
