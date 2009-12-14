        SUBROUTINE czlaqge(m,
     $   n,
     $   a,
     $   lda,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
c
c       lapack_zlaqge.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  r(*)
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  rowcnd
        DOUBLE PRECISION  colcnd
        DOUBLE PRECISION  amax
        CHARACTER  equed

        CALL fzlaqge(m,
     $   n,
     $   a,
     $   lda,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
        RETURN
        END
