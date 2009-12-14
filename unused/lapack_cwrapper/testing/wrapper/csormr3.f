        SUBROUTINE csormr3(side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   info)
c
c       lapack_sormr3.c
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
        CHARACTER  trans
        INTEGER  m
        INTEGER  n
        INTEGER  k
        INTEGER  l
        REAL  a(*)
        INTEGER  lda
        REAL  tau(*)
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)
        INTEGER  info

        CALL fsormr3(side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   info)
        RETURN
        END
