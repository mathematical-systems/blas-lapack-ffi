        DOUBLE PRECISION FUNCTION czlange(norm,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   work)
c
c       lapack_zlange.c
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
        INTEGER  m
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  work(*)

        EXTERNAL fzlange
        CALL fzlange(czlange, norm,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   work)
        RETURN
        END
