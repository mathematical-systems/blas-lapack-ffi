        SUBROUTINE cdlaqps(m,
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
c       lapack_dlaqps.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  vn1(*)
        DOUBLE PRECISION  vn2(*)
        DOUBLE PRECISION  auxv(*)
        DOUBLE PRECISION  f(*)
        INTEGER  ldf

        CALL fdlaqps(m,
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
