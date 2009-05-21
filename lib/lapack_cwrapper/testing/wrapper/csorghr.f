        SUBROUTINE csorghr(n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_sorghr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        REAL  a(*)
        INTEGER  lda
        REAL  tau(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsorghr(n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
