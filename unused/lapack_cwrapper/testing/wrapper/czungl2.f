        SUBROUTINE czungl2(m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
c
c       lapack_zungl2.c
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
        INTEGER  k
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  tau(*)
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzungl2(m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
