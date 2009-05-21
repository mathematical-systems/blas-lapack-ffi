        REAL FUNCTION cslantr(norm,
     $   uplo,
     $   diag,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   work)
c
c       lapack_slantr.c
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
        CHARACTER  uplo
        CHARACTER  diag
        INTEGER  m
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  work(*)

        EXTERNAL fslantr
        CALL fslantr(cslantr, norm,
     $   uplo,
     $   diag,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   work)
        RETURN
        END
