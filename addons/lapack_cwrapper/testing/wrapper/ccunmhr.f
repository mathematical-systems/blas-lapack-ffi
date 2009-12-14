        SUBROUTINE ccunmhr(side,
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
c       lapack_cunmhr.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  tau(*)
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcunmhr(side,
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
