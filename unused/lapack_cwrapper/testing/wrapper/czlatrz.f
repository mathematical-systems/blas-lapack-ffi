        SUBROUTINE czlatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
c
c       lapack_zlatrz.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        INTEGER  l
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  tau(*)
        COMPLEX*16  work(*)

        CALL fzlatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
        RETURN
        END
