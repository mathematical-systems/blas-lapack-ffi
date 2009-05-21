        SUBROUTINE czlaqps(m,
     $   n,
     $   offset,
     $   nb,
     $   kb,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   vn1,
     $   vn2,
     $   auxv,
     $   f,
     $   ldf)
c
c       lapack_zlaqps.c
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
        INTEGER  nb
        INTEGER  kb
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        COMPLEX*16  tau(*)
        DOUBLE PRECISION  vn1(*)
        DOUBLE PRECISION  vn2(*)
        COMPLEX*16  auxv(*)
        COMPLEX*16  f(*)
        INTEGER  ldf

        CALL fzlaqps(m,
     $   n,
     $   offset,
     $   nb,
     $   kb,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   vn1,
     $   vn2,
     $   auxv,
     $   f,
     $   ldf)
        RETURN
        END
