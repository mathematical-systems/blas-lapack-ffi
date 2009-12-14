        SUBROUTINE czunmrq(side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_zunmrq.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  tau(*)
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzunmrq(side,
     $   trans,
     $   m,
     $   n,
     $   k,
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
