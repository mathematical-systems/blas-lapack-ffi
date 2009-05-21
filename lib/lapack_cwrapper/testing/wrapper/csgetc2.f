        SUBROUTINE csgetc2(n,
     $   a,
     $   lda,
     $   ipiv,
     $   jpiv,
     $   info)
c
c       lapack_sgetc2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        INTEGER  jpiv(*)
        INTEGER  info

        CALL fsgetc2(n,
     $   a,
     $   lda,
     $   ipiv,
     $   jpiv,
     $   info)
        RETURN
        END
