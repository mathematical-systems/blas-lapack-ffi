        DOUBLE PRECISION FUNCTION czlangt(norm,
     $   n,
     $   dl,
     $   d,
     $   du)
c
c       lapack_zlangt.c
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
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)

        EXTERNAL fzlangt
        CALL fzlangt(czlangt, norm,
     $   n,
     $   dl,
     $   d,
     $   du)
        RETURN
        END
