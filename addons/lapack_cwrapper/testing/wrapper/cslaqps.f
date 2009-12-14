        SUBROUTINE cslaqps(m,
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
c       lapack_slaqps.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        REAL  tau(*)
        REAL  vn1(*)
        REAL  vn2(*)
        REAL  auxv(*)
        REAL  f(*)
        INTEGER  ldf

        CALL fslaqps(m,
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
