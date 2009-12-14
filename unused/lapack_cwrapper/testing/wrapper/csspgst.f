        SUBROUTINE csspgst(itype,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   info)
c
c       lapack_sspgst.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  uplo
        INTEGER  n
        REAL  ap(*)
        REAL  bp(*)
        INTEGER  info

        CALL fsspgst(itype,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   info)
        RETURN
        END
