        SUBROUTINE cdlaqp2(m,
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
c       lapack_dlaqp2.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  vn1(*)
        DOUBLE PRECISION  vn2(*)
        DOUBLE PRECISION  work(*)

        CALL fdlaqp2(m,
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
