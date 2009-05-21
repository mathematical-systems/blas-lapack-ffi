        DOUBLE PRECISION FUNCTION czlanhp(norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
c
c       lapack_zlanhp.c
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
        INTEGER  n
        COMPLEX*16  ap(*)
        DOUBLE PRECISION  work(*)

        EXTERNAL fzlanhp
        CALL fzlanhp(czlanhp, norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
