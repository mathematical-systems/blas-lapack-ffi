        DOUBLE PRECISION FUNCTION czlansp(norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
c
c       lapack_zlansp.c
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

        EXTERNAL fzlansp
        CALL fzlansp(czlansp, norm,
     $   uplo,
     $   n,
     $   ap,
     $   work)
        RETURN
        END
