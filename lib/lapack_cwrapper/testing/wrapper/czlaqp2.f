        SUBROUTINE czlaqp2(m,
     $   n,
     $   offset,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   vn1,
     $   vn2,
     $   work)
c
c       lapack_zlaqp2.c
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
        INTEGER  offset
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        COMPLEX*16  tau(*)
        DOUBLE PRECISION  vn1(*)
        DOUBLE PRECISION  vn2(*)
        COMPLEX*16  work(*)

        CALL fzlaqp2(m,
     $   n,
     $   offset,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   vn1,
     $   vn2,
     $   work)
        RETURN
        END
