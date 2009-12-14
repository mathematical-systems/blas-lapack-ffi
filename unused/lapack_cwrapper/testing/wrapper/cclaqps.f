        SUBROUTINE cclaqps(m,
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
c       lapack_claqps.c
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
        COMPLEX  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        COMPLEX  tau(*)
        REAL  vn1(*)
        REAL  vn2(*)
        COMPLEX  auxv(*)
        COMPLEX  f(*)
        INTEGER  ldf

        CALL fclaqps(m,
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
