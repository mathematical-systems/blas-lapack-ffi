        SUBROUTINE cclatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
c
c       lapack_clatrz.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  tau(*)
        COMPLEX  work(*)

        CALL fclatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
        RETURN
        END
