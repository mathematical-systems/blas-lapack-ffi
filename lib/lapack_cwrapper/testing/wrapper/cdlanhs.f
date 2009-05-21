        DOUBLE PRECISION FUNCTION cdlanhs(norm,
     $   n,
     $   a,
     $   lda,
     $   work)
c
c       lapack_dlanhs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  work(*)

        EXTERNAL fdlanhs
        CALL fdlanhs(cdlanhs, norm,
     $   n,
     $   a,
     $   lda,
     $   work)
        RETURN
        END
