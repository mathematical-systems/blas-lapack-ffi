        SUBROUTINE cslaqp2(m,
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
c       lapack_slaqp2.c
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
        REAL  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        REAL  tau(*)
        REAL  vn1(*)
        REAL  vn2(*)
        REAL  work(*)

        CALL fslaqp2(m,
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
