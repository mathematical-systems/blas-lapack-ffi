        SUBROUTINE cdormhr(side,
     $   trans,
     $   m,
     $   n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dormhr.c
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
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  c(*)
        INTEGER  ldc
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdormhr(side,
     $   trans,
     $   m,
     $   n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
